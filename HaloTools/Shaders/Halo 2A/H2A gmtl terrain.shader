// Upgrade NOTE: upgraded instancing buffer 'HaloToolsHalo2AnniversaryGMTLTerrainVertexColors' to new syntax.

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Halo Tools/Halo 2 Anniversary/GMTL Terrain (Vertex Colors)"
{
	Properties
	{
		_RedAlbedo("(Red) Albedo", 2D) = "white" {}
		_RedNormal("(Red) Normal", 2D) = "bump" {}
		_RedSpecular("(Red) Specular", 2D) = "black" {}
		_RedSmoothness("(Red) Smoothness", Range( 0 , 1)) = 0
		_GreenAlbedo("(Green) Albedo", 2D) = "white" {}
		_GreenNormal("(Green) Normal", 2D) = "bump" {}
		_GreenSpecular("(Green) Specular", 2D) = "black" {}
		_GreenSmoothness("(Green) Smoothness", Range( 0 , 1)) = 0
		_BlueAlbedo("(Blue) Albedo", 2D) = "white" {}
		_BlueNormal("(Blue) Normal", 2D) = "bump" {}
		_BlueSpecular("(Blue) Specular", 2D) = "black" {}
		_BlueSmoothness("(Blue) Smoothness", Range( 0 , 1)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma multi_compile_instancing
		#pragma surface surf StandardSpecular keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
		};

		uniform sampler2D _RedNormal;
		uniform sampler2D _GreenNormal;
		uniform sampler2D _BlueNormal;
		uniform sampler2D _RedAlbedo;
		uniform sampler2D _GreenAlbedo;
		uniform sampler2D _BlueAlbedo;
		uniform sampler2D _RedSpecular;
		uniform sampler2D _GreenSpecular;
		uniform sampler2D _BlueSpecular;

		UNITY_INSTANCING_BUFFER_START(HaloToolsHalo2AnniversaryGMTLTerrainVertexColors)
			UNITY_DEFINE_INSTANCED_PROP(float4, _RedNormal_ST)
#define _RedNormal_ST_arr HaloToolsHalo2AnniversaryGMTLTerrainVertexColors
			UNITY_DEFINE_INSTANCED_PROP(float4, _GreenNormal_ST)
#define _GreenNormal_ST_arr HaloToolsHalo2AnniversaryGMTLTerrainVertexColors
			UNITY_DEFINE_INSTANCED_PROP(float4, _BlueNormal_ST)
#define _BlueNormal_ST_arr HaloToolsHalo2AnniversaryGMTLTerrainVertexColors
			UNITY_DEFINE_INSTANCED_PROP(float4, _RedAlbedo_ST)
#define _RedAlbedo_ST_arr HaloToolsHalo2AnniversaryGMTLTerrainVertexColors
			UNITY_DEFINE_INSTANCED_PROP(float4, _GreenAlbedo_ST)
#define _GreenAlbedo_ST_arr HaloToolsHalo2AnniversaryGMTLTerrainVertexColors
			UNITY_DEFINE_INSTANCED_PROP(float4, _BlueAlbedo_ST)
#define _BlueAlbedo_ST_arr HaloToolsHalo2AnniversaryGMTLTerrainVertexColors
			UNITY_DEFINE_INSTANCED_PROP(float4, _RedSpecular_ST)
#define _RedSpecular_ST_arr HaloToolsHalo2AnniversaryGMTLTerrainVertexColors
			UNITY_DEFINE_INSTANCED_PROP(float4, _GreenSpecular_ST)
#define _GreenSpecular_ST_arr HaloToolsHalo2AnniversaryGMTLTerrainVertexColors
			UNITY_DEFINE_INSTANCED_PROP(float4, _BlueSpecular_ST)
#define _BlueSpecular_ST_arr HaloToolsHalo2AnniversaryGMTLTerrainVertexColors
			UNITY_DEFINE_INSTANCED_PROP(float, _RedSmoothness)
#define _RedSmoothness_arr HaloToolsHalo2AnniversaryGMTLTerrainVertexColors
			UNITY_DEFINE_INSTANCED_PROP(float, _GreenSmoothness)
#define _GreenSmoothness_arr HaloToolsHalo2AnniversaryGMTLTerrainVertexColors
			UNITY_DEFINE_INSTANCED_PROP(float, _BlueSmoothness)
#define _BlueSmoothness_arr HaloToolsHalo2AnniversaryGMTLTerrainVertexColors
		UNITY_INSTANCING_BUFFER_END(HaloToolsHalo2AnniversaryGMTLTerrainVertexColors)

		void surf( Input i , inout SurfaceOutputStandardSpecular o )
		{
			float4 _RedNormal_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_RedNormal_ST_arr, _RedNormal_ST);
			float2 uv_RedNormal = i.uv_texcoord * _RedNormal_ST_Instance.xy + _RedNormal_ST_Instance.zw;
			float3 clampResult61 = clamp( UnpackNormal( tex2D( _RedNormal, uv_RedNormal ) ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 RedNormal9 = ( clampResult61 * i.vertexColor.r );
			float4 _GreenNormal_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_GreenNormal_ST_arr, _GreenNormal_ST);
			float2 uv_GreenNormal = i.uv_texcoord * _GreenNormal_ST_Instance.xy + _GreenNormal_ST_Instance.zw;
			float3 clampResult62 = clamp( UnpackNormal( tex2D( _GreenNormal, uv_GreenNormal ) ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 GreenNormal26 = ( clampResult62 * i.vertexColor.g );
			float4 _BlueNormal_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_BlueNormal_ST_arr, _BlueNormal_ST);
			float2 uv_BlueNormal = i.uv_texcoord * _BlueNormal_ST_Instance.xy + _BlueNormal_ST_Instance.zw;
			float3 clampResult63 = clamp( UnpackNormal( tex2D( _BlueNormal, uv_BlueNormal ) ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 BlueNormal40 = ( clampResult63 * i.vertexColor.b );
			o.Normal = ( RedNormal9 + GreenNormal26 + BlueNormal40 );
			float4 _RedAlbedo_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_RedAlbedo_ST_arr, _RedAlbedo_ST);
			float2 uv_RedAlbedo = i.uv_texcoord * _RedAlbedo_ST_Instance.xy + _RedAlbedo_ST_Instance.zw;
			float4 RedAlbedo8 = ( tex2D( _RedAlbedo, uv_RedAlbedo ) * i.vertexColor.r );
			float4 _GreenAlbedo_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_GreenAlbedo_ST_arr, _GreenAlbedo_ST);
			float2 uv_GreenAlbedo = i.uv_texcoord * _GreenAlbedo_ST_Instance.xy + _GreenAlbedo_ST_Instance.zw;
			float4 GreenAlbedo25 = ( tex2D( _GreenAlbedo, uv_GreenAlbedo ) * i.vertexColor.g );
			float4 _BlueAlbedo_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_BlueAlbedo_ST_arr, _BlueAlbedo_ST);
			float2 uv_BlueAlbedo = i.uv_texcoord * _BlueAlbedo_ST_Instance.xy + _BlueAlbedo_ST_Instance.zw;
			float4 BlueAlbedo39 = ( tex2D( _BlueAlbedo, uv_BlueAlbedo ) * i.vertexColor.b );
			o.Albedo = ( RedAlbedo8 + GreenAlbedo25 + BlueAlbedo39 ).rgb;
			float4 _RedSpecular_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_RedSpecular_ST_arr, _RedSpecular_ST);
			float2 uv_RedSpecular = i.uv_texcoord * _RedSpecular_ST_Instance.xy + _RedSpecular_ST_Instance.zw;
			float4 RedSpecular10 = ( tex2D( _RedSpecular, uv_RedSpecular ) * i.vertexColor.r );
			float4 _GreenSpecular_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_GreenSpecular_ST_arr, _GreenSpecular_ST);
			float2 uv_GreenSpecular = i.uv_texcoord * _GreenSpecular_ST_Instance.xy + _GreenSpecular_ST_Instance.zw;
			float4 GreenSpecular27 = ( tex2D( _GreenSpecular, uv_GreenSpecular ) * i.vertexColor.g );
			float4 _BlueSpecular_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_BlueSpecular_ST_arr, _BlueSpecular_ST);
			float2 uv_BlueSpecular = i.uv_texcoord * _BlueSpecular_ST_Instance.xy + _BlueSpecular_ST_Instance.zw;
			float4 BlueSpecular41 = ( tex2D( _BlueSpecular, uv_BlueSpecular ) * i.vertexColor.b );
			o.Specular = ( RedSpecular10 + GreenSpecular27 + BlueSpecular41 ).rgb;
			float _RedSmoothness_Instance = UNITY_ACCESS_INSTANCED_PROP(_RedSmoothness_arr, _RedSmoothness);
			float RedSmoothness11 = ( _RedSmoothness_Instance * i.vertexColor.r );
			float _GreenSmoothness_Instance = UNITY_ACCESS_INSTANCED_PROP(_GreenSmoothness_arr, _GreenSmoothness);
			float GreenSmoothness28 = ( _GreenSmoothness_Instance * i.vertexColor.g );
			float _BlueSmoothness_Instance = UNITY_ACCESS_INSTANCED_PROP(_BlueSmoothness_arr, _BlueSmoothness);
			float BlueSmoothness42 = ( _BlueSmoothness_Instance * i.vertexColor.b );
			float clampResult60 = clamp( ( RedSmoothness11 + GreenSmoothness28 + BlueSmoothness42 ) , 0.0 , 1.0 );
			o.Smoothness = clampResult60;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18800
330.6667;720;1280;659;4768.303;1120.81;4.327599;True;False
Node;AmplifyShaderEditor.CommentaryNode;70;-1440,0;Inherit;False;745.0013;867.5406;BLUE;14;41;40;39;31;32;33;42;35;63;30;37;38;34;36;;0,0,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;69;-2192,0;Inherit;False;728.2798;867.2566;GREEN;14;27;26;25;23;28;24;22;62;19;17;21;20;18;29;;0,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;68;-2974.111,-5.052599;Inherit;False;734.6956;875.1404;RED;14;9;8;10;14;16;11;15;61;1;13;3;5;2;12;;1,0,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;38;-1387.899,599.9641;Inherit;False;InstancedProperty;_BlueSmoothness;(Blue) Smoothness;11;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-2146.889,607.7589;Inherit;False;InstancedProperty;_GreenSmoothness;(Green) Smoothness;7;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-2930.551,612.1789;Inherit;False;InstancedProperty;_RedSmoothness;(Red) Smoothness;3;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2;-2953.044,229.2099;Inherit;True;Property;_RedNormal;(Red) Normal;1;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;34;-1275.899,679.964;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;18;-2169.382,224.7897;Inherit;True;Property;_GreenNormal;(Green) Normal;5;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;36;-1410.392,216.9949;Inherit;True;Property;_BlueNormal;(Blue) Normal;9;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;29;-2034.889,687.7589;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;12;-2818.551,692.1788;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-2953.044,421.2101;Inherit;True;Property;_RedSpecular;(Red) Specular;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;37;-1410.392,408.995;Inherit;True;Property;_BlueSpecular;(Blue) Specular;10;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;30;-1035.899,599.9641;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;-2578.551,612.1789;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;-1794.89,607.7589;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;17;-2174.364,34.13081;Inherit;True;Property;_GreenAlbedo;(Green) Albedo;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;35;-1415.374,26.33565;Inherit;True;Property;_BlueAlbedo;(Blue) Albedo;8;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;62;-1792,288;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;1;-2958.026,38.55122;Inherit;True;Property;_RedAlbedo;(Red) Albedo;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;19;-2169.382,416.7899;Inherit;True;Property;_GreenSpecular;(Green) Specular;6;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;63;-1040,272;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;61;-2576,304;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;11;-2450.551,612.1789;Inherit;False;RedSmoothness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;-2578.551,36.17903;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;42;-907.8984,599.9641;Inherit;False;BlueSmoothness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;-1794.89,31.75886;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;22;-1794.89,415.7589;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-2576,208;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;33;-1035.899,23.96358;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;23;-1792,208;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-1035.899,407.964;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-2578.551,420.179;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-1040,192;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;28;-1666.89,607.7589;Inherit;False;GreenSmoothness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;40;-912,192;Inherit;False;BlueNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;39;-907.8984,23.96358;Inherit;False;BlueAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;56;-576,704;Inherit;False;11;RedSmoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;10;-2450.551,420.179;Inherit;False;RedSpecular;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;25;-1666.89,31.75886;Inherit;False;GreenAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;58;-576,864;Inherit;False;42;BlueSmoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;8;-2450.551,36.17903;Inherit;False;RedAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;57;-576,784;Inherit;False;28;GreenSmoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;41;-907.8984,407.964;Inherit;False;BlueSpecular;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;9;-2448,208;Inherit;False;RedNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;27;-1666.89,415.7589;Inherit;False;GreenSpecular;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;26;-1664,208;Inherit;False;GreenNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;55;-576,608;Inherit;False;41;BlueSpecular;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;52;-576,192;Inherit;False;9;RedNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;53;-576,448;Inherit;False;10;RedSpecular;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;54;-576,528;Inherit;False;27;GreenSpecular;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;47;-576,-64;Inherit;False;8;RedAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;48;-576,16;Inherit;False;25;GreenAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;51;-576,352;Inherit;False;40;BlueNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;46;-256,384;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;50;-576,272;Inherit;False;26;GreenNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;49;-576,96;Inherit;False;39;BlueAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;43;-256,0;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;45;-256,256;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;44;-256,128;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;60;-128,384;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;48,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;StandardSpecular;Halo Tools/Halo 2 Anniversary/GMTL Terrain (Vertex Colors);False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;30;0;38;0
WireConnection;30;1;34;3
WireConnection;13;0;5;0
WireConnection;13;1;12;1
WireConnection;21;0;20;0
WireConnection;21;1;29;2
WireConnection;62;0;18;0
WireConnection;63;0;36;0
WireConnection;61;0;2;0
WireConnection;11;0;13;0
WireConnection;16;0;1;0
WireConnection;16;1;12;1
WireConnection;42;0;30;0
WireConnection;24;0;17;0
WireConnection;24;1;29;2
WireConnection;22;0;19;0
WireConnection;22;1;29;2
WireConnection;15;0;61;0
WireConnection;15;1;12;1
WireConnection;33;0;35;0
WireConnection;33;1;34;3
WireConnection;23;0;62;0
WireConnection;23;1;29;2
WireConnection;31;0;37;0
WireConnection;31;1;34;3
WireConnection;14;0;3;0
WireConnection;14;1;12;1
WireConnection;32;0;63;0
WireConnection;32;1;34;3
WireConnection;28;0;21;0
WireConnection;40;0;32;0
WireConnection;39;0;33;0
WireConnection;10;0;14;0
WireConnection;25;0;24;0
WireConnection;8;0;16;0
WireConnection;41;0;31;0
WireConnection;9;0;15;0
WireConnection;27;0;22;0
WireConnection;26;0;23;0
WireConnection;46;0;56;0
WireConnection;46;1;57;0
WireConnection;46;2;58;0
WireConnection;43;0;47;0
WireConnection;43;1;48;0
WireConnection;43;2;49;0
WireConnection;45;0;53;0
WireConnection;45;1;54;0
WireConnection;45;2;55;0
WireConnection;44;0;52;0
WireConnection;44;1;50;0
WireConnection;44;2;51;0
WireConnection;60;0;46;0
WireConnection;0;0;43;0
WireConnection;0;1;44;0
WireConnection;0;3;45;0
WireConnection;0;4;60;0
ASEEND*/
//CHKSM=5BDF3C5B2C101FFDFD1A6458059320FF9AF25AE7