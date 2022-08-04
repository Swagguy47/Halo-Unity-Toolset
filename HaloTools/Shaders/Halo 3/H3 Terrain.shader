// Upgrade NOTE: upgraded instancing buffer 'HaloToolsHalo3Terrain' to new syntax.

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Halo Tools/Halo 3/Terrain"
{
	Properties
	{
		_Splatmap("Splatmap", 2D) = "white" {}
		_RAlbedo("(R) Albedo", 2D) = "white" {}
		_RNormal("(R) Normal", 2D) = "bump" {}
		_RSmoothness("(R) Smoothness", Range( 0 , 1)) = 0
		_RDetailAlbedo("(R) Detail Albedo", 2D) = "white" {}
		_RDetailNormal("(R) Detail Normal", 2D) = "white" {}
		_GAlbedo("(G) Albedo", 2D) = "white" {}
		_GNormal("(G) Normal", 2D) = "bump" {}
		_GSmoothness("(G) Smoothness", Range( 0 , 1)) = 0
		_GDetailAlbedo("(G) Detail Albedo", 2D) = "white" {}
		_GDetailNormal("(G) Detail Normal", 2D) = "white" {}
		_BAlbedo("(B) Albedo", 2D) = "white" {}
		_BNormal("(B) Normal", 2D) = "bump" {}
		_BSmoothness("(B) Smoothness", Range( 0 , 1)) = 0
		_BDetailAlbedo("(B) Detail Albedo", 2D) = "white" {}
		_BDetailNormal("(B) Detail Normal", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
		[Header(Forward Rendering Options)]
		[ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		[ToggleOff] _GlossyReflections("Reflections", Float) = 1.0
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma multi_compile_instancing
		#pragma shader_feature _SPECULARHIGHLIGHTS_OFF
		#pragma shader_feature _GLOSSYREFLECTIONS_OFF
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _RNormal;
		uniform sampler2D _Splatmap;
		uniform sampler2D _RDetailNormal;
		uniform sampler2D _GNormal;
		uniform sampler2D _GDetailNormal;
		uniform sampler2D _BNormal;
		uniform sampler2D _BDetailNormal;
		uniform sampler2D _RAlbedo;
		uniform sampler2D _RDetailAlbedo;
		uniform sampler2D _GAlbedo;
		uniform sampler2D _GDetailAlbedo;
		uniform sampler2D _BAlbedo;
		uniform sampler2D _BDetailAlbedo;

		UNITY_INSTANCING_BUFFER_START(HaloToolsHalo3Terrain)
			UNITY_DEFINE_INSTANCED_PROP(float4, _RNormal_ST)
#define _RNormal_ST_arr HaloToolsHalo3Terrain
			UNITY_DEFINE_INSTANCED_PROP(float4, _Splatmap_ST)
#define _Splatmap_ST_arr HaloToolsHalo3Terrain
			UNITY_DEFINE_INSTANCED_PROP(float4, _RDetailNormal_ST)
#define _RDetailNormal_ST_arr HaloToolsHalo3Terrain
			UNITY_DEFINE_INSTANCED_PROP(float4, _GNormal_ST)
#define _GNormal_ST_arr HaloToolsHalo3Terrain
			UNITY_DEFINE_INSTANCED_PROP(float4, _GDetailNormal_ST)
#define _GDetailNormal_ST_arr HaloToolsHalo3Terrain
			UNITY_DEFINE_INSTANCED_PROP(float4, _BNormal_ST)
#define _BNormal_ST_arr HaloToolsHalo3Terrain
			UNITY_DEFINE_INSTANCED_PROP(float4, _BDetailNormal_ST)
#define _BDetailNormal_ST_arr HaloToolsHalo3Terrain
			UNITY_DEFINE_INSTANCED_PROP(float4, _RAlbedo_ST)
#define _RAlbedo_ST_arr HaloToolsHalo3Terrain
			UNITY_DEFINE_INSTANCED_PROP(float4, _RDetailAlbedo_ST)
#define _RDetailAlbedo_ST_arr HaloToolsHalo3Terrain
			UNITY_DEFINE_INSTANCED_PROP(float4, _GAlbedo_ST)
#define _GAlbedo_ST_arr HaloToolsHalo3Terrain
			UNITY_DEFINE_INSTANCED_PROP(float4, _GDetailAlbedo_ST)
#define _GDetailAlbedo_ST_arr HaloToolsHalo3Terrain
			UNITY_DEFINE_INSTANCED_PROP(float4, _BAlbedo_ST)
#define _BAlbedo_ST_arr HaloToolsHalo3Terrain
			UNITY_DEFINE_INSTANCED_PROP(float4, _BDetailAlbedo_ST)
#define _BDetailAlbedo_ST_arr HaloToolsHalo3Terrain
			UNITY_DEFINE_INSTANCED_PROP(float, _RSmoothness)
#define _RSmoothness_arr HaloToolsHalo3Terrain
			UNITY_DEFINE_INSTANCED_PROP(float, _GSmoothness)
#define _GSmoothness_arr HaloToolsHalo3Terrain
			UNITY_DEFINE_INSTANCED_PROP(float, _BSmoothness)
#define _BSmoothness_arr HaloToolsHalo3Terrain
		UNITY_INSTANCING_BUFFER_END(HaloToolsHalo3Terrain)

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 _RNormal_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_RNormal_ST_arr, _RNormal_ST);
			float2 uv_RNormal = i.uv_texcoord * _RNormal_ST_Instance.xy + _RNormal_ST_Instance.zw;
			float4 _Splatmap_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_Splatmap_ST_arr, _Splatmap_ST);
			float2 uv_Splatmap = i.uv_texcoord * _Splatmap_ST_Instance.xy + _Splatmap_ST_Instance.zw;
			float4 BlendMap6 = tex2D( _Splatmap, uv_Splatmap );
			float4 _RDetailNormal_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_RDetailNormal_ST_arr, _RDetailNormal_ST);
			float2 uv_RDetailNormal = i.uv_texcoord * _RDetailNormal_ST_Instance.xy + _RDetailNormal_ST_Instance.zw;
			float3 RedNormal18 = ( ( UnpackNormal( tex2D( _RNormal, uv_RNormal ) ) * BlendMap6.r ) * ( UnpackNormal( tex2D( _RDetailNormal, uv_RDetailNormal ) ) * BlendMap6.r ) );
			float4 _GNormal_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_GNormal_ST_arr, _GNormal_ST);
			float2 uv_GNormal = i.uv_texcoord * _GNormal_ST_Instance.xy + _GNormal_ST_Instance.zw;
			float4 _GDetailNormal_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_GDetailNormal_ST_arr, _GDetailNormal_ST);
			float2 uv_GDetailNormal = i.uv_texcoord * _GDetailNormal_ST_Instance.xy + _GDetailNormal_ST_Instance.zw;
			float3 GreenNormal36 = ( ( UnpackNormal( tex2D( _GNormal, uv_GNormal ) ) * BlendMap6.g ) * ( UnpackNormal( tex2D( _GDetailNormal, uv_GDetailNormal ) ) * BlendMap6.g ) );
			float4 _BNormal_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_BNormal_ST_arr, _BNormal_ST);
			float2 uv_BNormal = i.uv_texcoord * _BNormal_ST_Instance.xy + _BNormal_ST_Instance.zw;
			float4 _BDetailNormal_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_BDetailNormal_ST_arr, _BDetailNormal_ST);
			float2 uv_BDetailNormal = i.uv_texcoord * _BDetailNormal_ST_Instance.xy + _BDetailNormal_ST_Instance.zw;
			float3 BlueNormal59 = ( ( UnpackNormal( tex2D( _BNormal, uv_BNormal ) ) * BlendMap6.b ) * ( UnpackNormal( tex2D( _BDetailNormal, uv_BDetailNormal ) ) * BlendMap6.b ) );
			float3 FinalNormal78 = ( RedNormal18 + GreenNormal36 + BlueNormal59 );
			o.Normal = FinalNormal78;
			float4 _RAlbedo_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_RAlbedo_ST_arr, _RAlbedo_ST);
			float2 uv_RAlbedo = i.uv_texcoord * _RAlbedo_ST_Instance.xy + _RAlbedo_ST_Instance.zw;
			float4 tex2DNode2 = tex2D( _RAlbedo, uv_RAlbedo );
			float4 _RDetailAlbedo_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_RDetailAlbedo_ST_arr, _RDetailAlbedo_ST);
			float2 uv_RDetailAlbedo = i.uv_texcoord * _RDetailAlbedo_ST_Instance.xy + _RDetailAlbedo_ST_Instance.zw;
			float4 RedAlbedo17 = ( ( tex2DNode2 * BlendMap6.r ) * ( tex2D( _RDetailAlbedo, uv_RDetailAlbedo ) * BlendMap6.r ) );
			float4 _GAlbedo_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_GAlbedo_ST_arr, _GAlbedo_ST);
			float2 uv_GAlbedo = i.uv_texcoord * _GAlbedo_ST_Instance.xy + _GAlbedo_ST_Instance.zw;
			float4 tex2DNode34 = tex2D( _GAlbedo, uv_GAlbedo );
			float4 _GDetailAlbedo_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_GDetailAlbedo_ST_arr, _GDetailAlbedo_ST);
			float2 uv_GDetailAlbedo = i.uv_texcoord * _GDetailAlbedo_ST_Instance.xy + _GDetailAlbedo_ST_Instance.zw;
			float4 GreenAlbedo24 = ( ( tex2DNode34 * BlendMap6.g ) * ( tex2D( _GDetailAlbedo, uv_GDetailAlbedo ) * BlendMap6.g ) );
			float4 _BAlbedo_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_BAlbedo_ST_arr, _BAlbedo_ST);
			float2 uv_BAlbedo = i.uv_texcoord * _BAlbedo_ST_Instance.xy + _BAlbedo_ST_Instance.zw;
			float4 tex2DNode55 = tex2D( _BAlbedo, uv_BAlbedo );
			float4 _BDetailAlbedo_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_BDetailAlbedo_ST_arr, _BDetailAlbedo_ST);
			float2 uv_BDetailAlbedo = i.uv_texcoord * _BDetailAlbedo_ST_Instance.xy + _BDetailAlbedo_ST_Instance.zw;
			float4 BlueAlbedo60 = ( ( tex2DNode55 * BlendMap6.b ) * ( tex2D( _BDetailAlbedo, uv_BDetailAlbedo ) * BlendMap6.b ) );
			float4 FinalAlbedo71 = ( RedAlbedo17 + GreenAlbedo24 + BlueAlbedo60 );
			o.Albedo = FinalAlbedo71.rgb;
			float RedSpecular15 = ( tex2DNode2.a * BlendMap6.r );
			float GreenSpecular25 = ( tex2DNode34.a * BlendMap6.g );
			float BlueSpecular61 = ( tex2DNode55.a * BlendMap6.b );
			float FinalSpecular88 = ( RedSpecular15 + GreenSpecular25 + BlueSpecular61 );
			o.Metallic = FinalSpecular88;
			float _RSmoothness_Instance = UNITY_ACCESS_INSTANCED_PROP(_RSmoothness_arr, _RSmoothness);
			float RedSmoothness21 = ( BlendMap6.r * _RSmoothness_Instance );
			float _GSmoothness_Instance = UNITY_ACCESS_INSTANCED_PROP(_GSmoothness_arr, _GSmoothness);
			float GreenSmoothness23 = ( BlendMap6.g * _GSmoothness_Instance );
			float _BSmoothness_Instance = UNITY_ACCESS_INSTANCED_PROP(_BSmoothness_arr, _BSmoothness);
			float BlueSmoothness58 = ( BlendMap6.b * _BSmoothness_Instance );
			float FinalSmoothness83 = ( RedSmoothness21 + GreenSmoothness23 + BlueSmoothness58 );
			o.Smoothness = FinalSmoothness83;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18800
330.6667;720;1280;659;3272.891;1725.376;1.851541;True;False
Node;AmplifyShaderEditor.SamplerNode;1;-233.3284,-284.2816;Inherit;True;Property;_Splatmap;Splatmap;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;6;71.49092,-277.7358;Inherit;False;BlendMap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;48;-1077.037,-345.0807;Inherit;False;6;BlendMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;7;-3196.351,-319.8929;Inherit;False;6;BlendMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;38;-2076.351,-335.8929;Inherit;False;6;BlendMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;32;-2079.2,-523.9434;Inherit;True;Property;_GDetailNormal;(G) Detail Normal;10;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;46;-3020.351,-319.8929;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SamplerNode;4;-3191.299,-503.1249;Inherit;True;Property;_RDetailNormal;(R) Detail Normal;5;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;33;-2079.2,-715.9434;Inherit;True;Property;_GDetailAlbedo;(G) Detail Albedo;9;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;62;-1079.887,-725.1313;Inherit;True;Property;_BDetailAlbedo;(B) Detail Albedo;14;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;5;-3191.299,-695.1249;Inherit;True;Property;_RDetailAlbedo;(R) Detail Albedo;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-3194.81,-1084.444;Inherit;True;Property;_RAlbedo;(R) Albedo;1;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;55;-1083.398,-1114.45;Inherit;True;Property;_BAlbedo;(B) Albedo;11;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;34;-2082.711,-1105.262;Inherit;True;Property;_GAlbedo;(G) Albedo;6;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-3191.299,-887.1249;Inherit;True;Property;_RNormal;(R) Normal;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;49;-917.0375,-345.0807;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SamplerNode;57;-1079.887,-917.1315;Inherit;True;Property;_BNormal;(B) Normal;12;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;47;-1916.35,-335.8929;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SamplerNode;35;-2079.2,-907.9434;Inherit;True;Property;_GNormal;(G) Normal;7;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;65;-1079.887,-533.1313;Inherit;True;Property;_BDetailNormal;(B) Detail Normal;15;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;30;-1743.2,-907.9434;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;29;-1743.2,-1099.944;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;52;-743.8878,-917.1315;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;64;-743.8878,-725.1313;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-2855.299,-887.1249;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-2855.299,-695.1249;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;-2855.299,-1079.125;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;19;-3164.351,-191.8928;Inherit;False;InstancedProperty;_RSmoothness;(R) Smoothness;3;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-2855.299,-503.1249;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;51;-743.8878,-1109.132;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;22;-1743.2,-715.9434;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;37;-1743.2,-523.9434;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;54;-743.8878,-533.1313;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;66;-1061.037,-217.0807;Inherit;False;InstancedProperty;_BSmoothness;(B) Smoothness;13;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-2060.35,-207.8929;Inherit;False;InstancedProperty;_GSmoothness;(G) Smoothness;8;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-1743.2,-331.9438;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;-1743.2,-1003.944;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;53;-743.8878,-341.1316;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;20;-2855.299,-311.1252;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;27;-1535.199,-923.9434;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-2647.299,-903.1249;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;50;-743.8878,-1013.132;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;26;-1535.199,-715.9434;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-2855.299,-983.1254;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;56;-535.8875,-933.1315;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;63;-535.8875,-725.1313;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;-2647.299,-695.1249;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;60;-391.8874,-933.1315;Inherit;False;BlueAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;15;-2647.299,-983.1254;Inherit;False;RedSpecular;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;18;-2503.299,-695.1249;Inherit;False;RedNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;21;-2711.299,-311.1252;Inherit;False;RedSmoothness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;25;-1535.199,-1003.944;Inherit;False;GreenSpecular;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;61;-535.8875,-1013.132;Inherit;False;BlueSpecular;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;58;-599.8876,-341.1316;Inherit;False;BlueSmoothness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;17;-2503.299,-903.1249;Inherit;False;RedAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;24;-1391.199,-923.9434;Inherit;False;GreenAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;59;-391.8874,-725.1313;Inherit;False;BlueNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;36;-1391.199,-715.9434;Inherit;False;GreenNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;23;-1599.199,-331.9438;Inherit;False;GreenSmoothness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;86;-1909.99,419.9958;Inherit;False;61;BlueSpecular;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;79;-1925.99,3.995598;Inherit;False;21;RedSmoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;67;-1312,0;Inherit;False;17;RedAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;68;-1328,80;Inherit;False;24;GreenAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;74;-1312,416;Inherit;False;59;BlueNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;81;-1925.99,163.9957;Inherit;False;58;BlueSmoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;69;-1312,160;Inherit;False;60;BlueAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;84;-1909.99,259.9958;Inherit;False;15;RedSpecular;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;73;-1328,336;Inherit;False;36;GreenNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;85;-1925.99,339.9958;Inherit;False;25;GreenSpecular;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;80;-1941.99,83.99566;Inherit;False;23;GreenSmoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;72;-1312,256;Inherit;False;18;RedNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;75;-1088,320;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;82;-1701.99,67.99566;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;70;-1088,64;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;87;-1685.99,323.9958;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;83;-1589.991,67.99566;Inherit;False;FinalSmoothness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;88;-1573.991,323.9958;Inherit;False;FinalSpecular;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;78;-848,320;Inherit;False;FinalNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;71;-960,64;Inherit;False;FinalAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;92;-208,192;Inherit;False;83;FinalSmoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;91;-208,128;Inherit;False;88;FinalSpecular;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;90;-208,64;Inherit;False;78;FinalNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;89;-208,0;Inherit;False;71;FinalAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;93;-50,-50;Inherit;False;307.3333;505;c;1;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClampOpNode;77;-976,224;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Halo Tools/Halo 3/Terrain;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CommentaryNode;94;-2259.215,-1385.345;Inherit;False;999;154;Unfinished, looks kinda bad rn, also should be a second variant of this shader for overlay terrain;0;;1,1,1,1;0;0
WireConnection;6;0;1;0
WireConnection;46;0;7;0
WireConnection;49;0;48;0
WireConnection;47;0;38;0
WireConnection;30;0;35;0
WireConnection;30;1;47;1
WireConnection;29;0;34;0
WireConnection;29;1;47;1
WireConnection;52;0;57;0
WireConnection;52;1;49;2
WireConnection;64;0;62;0
WireConnection;64;1;49;2
WireConnection;10;0;3;0
WireConnection;10;1;46;0
WireConnection;9;0;5;0
WireConnection;9;1;46;0
WireConnection;11;0;2;0
WireConnection;11;1;46;0
WireConnection;8;0;4;0
WireConnection;8;1;46;0
WireConnection;51;0;55;0
WireConnection;51;1;49;2
WireConnection;22;0;33;0
WireConnection;22;1;47;1
WireConnection;37;0;32;0
WireConnection;37;1;47;1
WireConnection;54;0;65;0
WireConnection;54;1;49;2
WireConnection;31;0;47;1
WireConnection;31;1;39;0
WireConnection;28;0;34;4
WireConnection;28;1;47;1
WireConnection;53;0;49;2
WireConnection;53;1;66;0
WireConnection;20;0;46;0
WireConnection;20;1;19;0
WireConnection;27;0;29;0
WireConnection;27;1;22;0
WireConnection;12;0;11;0
WireConnection;12;1;9;0
WireConnection;50;0;55;4
WireConnection;50;1;49;2
WireConnection;26;0;30;0
WireConnection;26;1;37;0
WireConnection;14;0;2;4
WireConnection;14;1;46;0
WireConnection;56;0;51;0
WireConnection;56;1;64;0
WireConnection;63;0;52;0
WireConnection;63;1;54;0
WireConnection;13;0;10;0
WireConnection;13;1;8;0
WireConnection;60;0;56;0
WireConnection;15;0;14;0
WireConnection;18;0;13;0
WireConnection;21;0;20;0
WireConnection;25;0;28;0
WireConnection;61;0;50;0
WireConnection;58;0;53;0
WireConnection;17;0;12;0
WireConnection;24;0;27;0
WireConnection;59;0;63;0
WireConnection;36;0;26;0
WireConnection;23;0;31;0
WireConnection;75;0;72;0
WireConnection;75;1;73;0
WireConnection;75;2;74;0
WireConnection;82;0;79;0
WireConnection;82;1;80;0
WireConnection;82;2;81;0
WireConnection;70;0;67;0
WireConnection;70;1;68;0
WireConnection;70;2;69;0
WireConnection;87;0;84;0
WireConnection;87;1;85;0
WireConnection;87;2;86;0
WireConnection;83;0;82;0
WireConnection;88;0;87;0
WireConnection;78;0;75;0
WireConnection;71;0;70;0
WireConnection;0;0;89;0
WireConnection;0;1;90;0
WireConnection;0;3;91;0
WireConnection;0;4;92;0
ASEEND*/
//CHKSM=4351C3999EC2EB5D64FBA73C4174522FD1B989B9