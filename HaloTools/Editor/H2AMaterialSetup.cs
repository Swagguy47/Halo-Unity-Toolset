using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System;
using System.IO;
using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;

//This is a simplified version of H2AMaterialConverter that simply uses Material names instead of reading JSON data
//But does not have the ability to setup material properties 
public class H2AMaterialSetup : EditorWindow
{
    public Material[] H2AMaterials;

    private string TextureDirectory;

    private string FileType = ".png";

    //Overrides
    private bool ChangeShader = true;
    private bool ChangeTex = true;
    private bool ChangeProperties = true;
    private bool HighlightTerrain = true;

    private bool skipAlbedo;
    private bool skipHdetm;
    private bool skipNormal;
    private bool skipSpecular;
    private bool skipEmission;

    [Range(0, 1)] private float OverrideHdetm = 0.04f;
    private float OverrideNormal = 1;
    [Range(0,1)] private float OverrideSpecular = 0.75f;
    private float OverrideEmission = 1;

    [MenuItem("Halo Tools/Halo 2 Anniversary/Simplified Material Setup")]
    public static void ShowWindow()
    {
        EditorWindow.GetWindow(typeof(H2AMaterialSetup));
    }

    private void OnGUI()
    {
        GUILayout.Label("Converts H2A materials to Unity materials");
        GUILayout.Space(5f);
        GUILayout.Label("(Tip: Select all the material files and drag them over the dropdown)");
        GUILayout.Space(5f);

        //Array field
        ScriptableObject scriptableObj = this;
        SerializedObject serialObj = new SerializedObject(scriptableObj);
        SerializedProperty serialJson = serialObj.FindProperty("H2AMaterials");

        EditorGUILayout.PropertyField(serialJson, true);
        serialObj.ApplyModifiedProperties();
        //-----

        GUILayout.Label("Textures folder:");
        TextureDirectory = EditorGUILayout.TextField(TextureDirectory);
        if (GUILayout.Button("Use Selected Folder"))
        {
            SelectedFolder();
        }
        GUILayout.Space(5f);

        GUILayout.Label("Texture File Type:");
        FileType = EditorGUILayout.TextField(FileType);
        GUILayout.Space(15f);

        //Placeholders
        GUILayout.Label("Overrides:");
        ChangeShader = GUILayout.Toggle(ChangeShader, "Change shaders");
        ChangeTex = GUILayout.Toggle(ChangeTex, "Change textures");
        ChangeProperties = GUILayout.Toggle(ChangeProperties, "Change material properties");
        skipAlbedo = GUILayout.Toggle(skipAlbedo, "Skip Albedo maps");
        skipHdetm = GUILayout.Toggle(skipHdetm, "Skip Hdetm maps");
        skipNormal = GUILayout.Toggle(skipNormal, "Skip Normal maps");
        skipSpecular = GUILayout.Toggle(skipSpecular, "Skip Specular maps");
        skipEmission = GUILayout.Toggle(skipEmission, "Skip Emission maps");
        HighlightTerrain = GUILayout.Toggle(HighlightTerrain, "Highlight GMTL terrain material(s)");

        GUILayout.Label("Normal Intensity:");
        OverrideNormal = EditorGUILayout.FloatField(OverrideNormal);

        GUILayout.Label("Emission Intensity:");
        OverrideEmission = EditorGUILayout.FloatField(OverrideEmission);

        GUILayout.Label("Smoothness:");
        OverrideSpecular = EditorGUILayout.Slider(OverrideSpecular, 0, 1);

        GUILayout.Label("Hdetm height offset:");
        OverrideHdetm = EditorGUILayout.Slider(OverrideHdetm, 0, 1);


        if (GUILayout.Button("Convert"))
        {
            ConvertMaterials();
        }
    }

    private void SelectedFolder()
    {
        var Getpath = "";
        var obj = Selection.activeObject;
        if (obj == null) Getpath = "Assets";
        else Getpath = AssetDatabase.GetAssetPath(obj.GetInstanceID());
        if (Getpath.Length > 0)
        {
            if (Directory.Exists(Getpath))
            {
                TextureDirectory = Getpath + "/";
                Debug.Log("Path Set! (" + TextureDirectory + ")");
            }
        }
    }

    public void ConvertMaterials()
    {
        Debug.Log("Setting up materials...");
        foreach (Material CurrentMat in H2AMaterials)
        {
            if (ChangeShader && CurrentMat.shader != Shader.Find("Halo Tools/Halo 2 Anniversary/Standard"))
            {
                CurrentMat.shader = Shader.Find("Halo Tools/Halo 2 Anniversary/Standard");
            }
            
            if (ChangeTex)
            {
                //Albedo
                if (!skipAlbedo && (Texture)AssetDatabase.LoadAssetAtPath(TextureDirectory + CurrentMat.name + FileType, typeof(Texture)) != null)
                {
                    CurrentMat.mainTexture = (Texture)AssetDatabase.LoadAssetAtPath(TextureDirectory + CurrentMat.name + FileType, typeof(Texture));
                }
                //Normal
                if (!skipNormal && (Texture)AssetDatabase.LoadAssetAtPath(TextureDirectory + CurrentMat.name + "_nm" + FileType, typeof(Texture)) != null)
                {
                    CurrentMat.SetTexture("_BumpMap", (Texture)AssetDatabase.LoadAssetAtPath(TextureDirectory + CurrentMat.name + "_nm" + FileType, typeof(Texture)));
                }

                //Specular
                if (!skipSpecular && (Texture)AssetDatabase.LoadAssetAtPath(TextureDirectory + CurrentMat.name + "_spec" + FileType, typeof(Texture)) != null)
                {
                    CurrentMat.SetTexture("_SpecGlossMap", (Texture)AssetDatabase.LoadAssetAtPath(TextureDirectory + CurrentMat.name + "_spec" + FileType, typeof(Texture)));
                }

                //Emission
                if (!skipEmission && (Texture)AssetDatabase.LoadAssetAtPath(TextureDirectory + CurrentMat.name + "_em" + FileType, typeof(Texture)) != null)
                {
                    CurrentMat.EnableKeyword("_EMISSION");
                    CurrentMat.SetTexture("_EmissionMap", (Texture)AssetDatabase.LoadAssetAtPath(TextureDirectory + CurrentMat.name + "_em" + FileType, typeof(Texture)));
                }

                //Hdetm
                if (!skipHdetm && (Texture)AssetDatabase.LoadAssetAtPath(TextureDirectory + CurrentMat.name + "_hdetm" + FileType, typeof(Texture)) != null)
                {
                    CurrentMat.SetTexture("_ParallaxMap", (Texture)AssetDatabase.LoadAssetAtPath(TextureDirectory + CurrentMat.name + "_hdetm" + FileType, typeof(Texture)));
                }
            }

            if (ChangeProperties) //Copypaste because yes
            {
                //Normal
                if (!skipNormal && (Texture)AssetDatabase.LoadAssetAtPath(TextureDirectory + CurrentMat.name + "_nm" + FileType, typeof(Texture)) != null)
                {
                    CurrentMat.SetFloat("_BumpScale", OverrideNormal);
                }

                //Specular
                if (!skipSpecular && (Texture)AssetDatabase.LoadAssetAtPath(TextureDirectory + CurrentMat.name + "_spec" + FileType, typeof(Texture)) != null)
                {
                    CurrentMat.SetFloat("_GlossMapScale", OverrideSpecular);
                }

                //Emission
                if (!skipEmission && (Texture)AssetDatabase.LoadAssetAtPath(TextureDirectory + CurrentMat.name + "_em" + FileType, typeof(Texture)) != null)
                {
                    CurrentMat.EnableKeyword("_EMISSION");
                    CurrentMat.SetColor("_EmissionColor", Color.white);
                    CurrentMat.SetFloat("_EmissionIntensity", OverrideEmission);
                    //CurrentMat.SetColor("_EmissionColor", CurrentMat.GetColor("_EmissionColor") * OverrideEmission);
                }

                //Hdetm
                if (!skipHdetm && (Texture)AssetDatabase.LoadAssetAtPath(TextureDirectory + CurrentMat.name + "_hdetm" + FileType, typeof(Texture)) != null)
                {
                    CurrentMat.SetFloat("_Parallax", OverrideHdetm);
                }
                
                if (HighlightTerrain && CurrentMat.name.Contains("gmtl"))
                {
                    Debug.Log("Gmtl terrain mat found");
                    CurrentMat.shader = Shader.Find("Unlit/Color");
                    CurrentMat.SetColor("_Color", UnityEngine.Random.ColorHSV());
                }
            }
        }
        Debug.Log("DONE!");
    }
}
