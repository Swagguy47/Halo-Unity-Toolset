using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System;
using System.IO;
using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;

public class H2AMaterialConverter : EditorWindow
{
    public TextAsset[] JsonFiles;

    private string MaterialDirectory;

    private string TextureDirectory;

    //Not yet ready
    //[MenuItem("Halo Tools/Halo 2 Anniversary/JSON Material Converter")]
    public static void ShowWindow()
    {
        EditorWindow.GetWindow(typeof(H2AMaterialConverter));
    }

    private void OnGUI()
    {
        GUILayout.Label("Converts H2A materials to Unity materials");
        GUILayout.Space(5f);
        GUILayout.Label("(Tip: Select all the json files and drag them over the 'json files' dropdown)");
        GUILayout.Space(5f);

        //Array field
        ScriptableObject scriptableObj = this;
        SerializedObject serialObj = new SerializedObject(scriptableObj);
        SerializedProperty serialJson = serialObj.FindProperty("JsonFiles");

        EditorGUILayout.PropertyField(serialJson, true);
        serialObj.ApplyModifiedProperties();
        //-----

        GUILayout.Label("Materials folder:");
        MaterialDirectory = EditorGUILayout.TextField(MaterialDirectory);
        if (GUILayout.Button("Use Selected Folder"))
        {
            SelectedFolder(true);
        }
        GUILayout.Space(5f);
        GUILayout.Label("Textures folder:");
        TextureDirectory = EditorGUILayout.TextField(TextureDirectory);
        if (GUILayout.Button("Use Selected Folder"))
        {
            SelectedFolder(false);
        }
        GUILayout.Space(15f);

        //Placeholders
        GUILayout.Label("Overrides:");
        GUILayout.Toggle(true, "Change shaders");
        GUILayout.Toggle(true, "Change textures");
        GUILayout.Toggle(true, "Change material properties");
        GUILayout.Toggle(false, "Skip Albedo maps");
        GUILayout.Toggle(false, "Skip Hdetm maps");
        GUILayout.Toggle(false, "Skip Normal maps");
        GUILayout.Toggle(false, "Skip Specular maps");
        GUILayout.Toggle(false, "Skip Emission maps");
        GUILayout.Toggle(false, "Highlight GMTL terrain material(s)");

        if (GUILayout.Button("Convert"))
        {
            ConvertMaterials();
        }
    }

    private void SelectedFolder(bool MatOrNah)
    {
        if (MatOrNah)
        {
            var Getpath = "";
            var obj = Selection.activeObject;
            if (obj == null) Getpath = "Assets";
            else Getpath = AssetDatabase.GetAssetPath(obj.GetInstanceID());
            if (Getpath.Length > 0)
            {
                if (Directory.Exists(Getpath))
                {
                    MaterialDirectory = Getpath;
                    Debug.Log("Path Set! (" + MaterialDirectory + ")");
                }
            }
        }
        else
        {
            var Getpath = "";
            var obj = Selection.activeObject;
            if (obj == null) Getpath = "Assets";
            else Getpath = AssetDatabase.GetAssetPath(obj.GetInstanceID());
            if (Getpath.Length > 0)
            {
                if (Directory.Exists(Getpath))
                {
                    TextureDirectory = Getpath;
                    Debug.Log("Path Set! (" + TextureDirectory + ")");
                }
            }
        }
    }

    public void ConvertMaterials()
    {

    }
}
