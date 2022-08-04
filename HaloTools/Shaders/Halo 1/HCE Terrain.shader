// Upgrade NOTE: upgraded instancing buffer 'HaloToolsHalo1Terrain' to new syntax.

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Halo Tools/Halo 1/Terrain"
{
	Properties
	{
		_Cheatsaturation("(Cheat) saturation", Float) = 2
		_MainTex("Ground Tex Overlay", 2D) = "white" {}
		_Detail01("Detail 01", 2D) = "white" {}
		_Detail02("Detail 02", 2D) = "white" {}
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
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _MainTex;
		uniform sampler2D _Detail01;
		uniform sampler2D _Detail02;

		UNITY_INSTANCING_BUFFER_START(HaloToolsHalo1Terrain)
			UNITY_DEFINE_INSTANCED_PROP(float4, _MainTex_ST)
#define _MainTex_ST_arr HaloToolsHalo1Terrain
			UNITY_DEFINE_INSTANCED_PROP(float4, _Detail01_ST)
#define _Detail01_ST_arr HaloToolsHalo1Terrain
			UNITY_DEFINE_INSTANCED_PROP(float4, _Detail02_ST)
#define _Detail02_ST_arr HaloToolsHalo1Terrain
			UNITY_DEFINE_INSTANCED_PROP(float, _Cheatsaturation)
#define _Cheatsaturation_arr HaloToolsHalo1Terrain
		UNITY_INSTANCING_BUFFER_END(HaloToolsHalo1Terrain)

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 _MainTex_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_MainTex_ST_arr, _MainTex_ST);
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST_Instance.xy + _MainTex_ST_Instance.zw;
			float4 tex2DNode1 = tex2D( _MainTex, uv_MainTex );
			float _Cheatsaturation_Instance = UNITY_ACCESS_INSTANCED_PROP(_Cheatsaturation_arr, _Cheatsaturation);
			float3 desaturateInitialColor14 = tex2DNode1.rgb;
			float desaturateDot14 = dot( desaturateInitialColor14, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar14 = lerp( desaturateInitialColor14, desaturateDot14.xxx, (1.0 + (_Cheatsaturation_Instance - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) );
			float4 _Detail01_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_Detail01_ST_arr, _Detail01_ST);
			float2 uv_Detail01 = i.uv_texcoord * _Detail01_ST_Instance.xy + _Detail01_ST_Instance.zw;
			float4 _Detail02_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_Detail02_ST_arr, _Detail02_ST);
			float2 uv_Detail02 = i.uv_texcoord * _Detail02_ST_Instance.xy + _Detail02_ST_Instance.zw;
			o.Albedo = ( float4( ( desaturateVar14 * float3( 2,2,2 ) ) , 0.0 ) * ( ( tex2DNode1.a * tex2D( _Detail01, uv_Detail01 ) ) + ( (1.0 + (tex2DNode1.a - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) * tex2D( _Detail02, uv_Detail02 ) ) ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18800
330.6667;720;1280;659;1434.292;364.9386;1;True;False
Node;AmplifyShaderEditor.SamplerNode;1;-752,-160;Inherit;True;Property;_MainTex;Ground Tex Overlay;1;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;18;-1260.292,7.061401;Inherit;False;InstancedProperty;_Cheatsaturation;(Cheat) saturation;0;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3;-752,192;Inherit;True;Property;_Detail01;Detail 01;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;-752,384;Inherit;True;Property;_Detail02;Detail 02;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;5;-656,32;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;19;-1018.292,11.0614;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;-448,192;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-448,384;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DesaturateOpNode;14;-366.0612,-2.640706;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;-1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;7;-288,288;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;-173.6613,68.85928;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;-155.4612,226.1593;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Halo Tools/Halo 1/Terrain;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;0;1;4
WireConnection;19;0;18;0
WireConnection;2;0;1;4
WireConnection;2;1;3;0
WireConnection;6;0;5;0
WireConnection;6;1;4;0
WireConnection;14;0;1;0
WireConnection;14;1;19;0
WireConnection;7;0;2;0
WireConnection;7;1;6;0
WireConnection;17;0;14;0
WireConnection;13;0;17;0
WireConnection;13;1;7;0
WireConnection;0;0;13;0
ASEEND*/
//CHKSM=E01BF29DADDAFF95D3871AA3C02BA577B08A8C8C