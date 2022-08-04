// Upgrade NOTE: upgraded instancing buffer 'HaloToolsHalo2AnniversaryStandard' to new syntax.

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Halo Tools/Halo 2 Anniversary/Standard"
{
	Properties
	{
		[Toggle]_OneMinus("OneMinus", Float) = 0
		_ZoneColor("Zone Color", Color) = (1,1,1,0)
		_MainTex("Albedo", 2D) = "white" {}
		_SpecGlossMap("Specular", 2D) = "white" {}
		_GlossMapScale("Smoothness", Range( 0 , 1)) = 0
		_BumpMap("Normal", 2D) = "bump" {}
		_BumpScale("Normal Intensity", Float) = 1
		[Toggle]_EMISSION("Toggle Emission", Float) = 0
		_EmissionColor("Emission Color", Color) = (1,1,1,0)
		_EmissionMap("Emission", 2D) = "white" {}
		_EmissionIntensity("Emission Intensity", Float) = 1
		_DetailAlbedoMap("Detail Albedo", 2D) = "black" {}
		_DetailNormalMap("Detail Normal", 2D) = "bump" {}
		_DetailNormalIntensity("Detail Normal Intensity", Float) = 1
		_FresnelPower("Fresnel Power", Float) = 3
		_FresnelScale("Fresnel Scale", Float) = 0.015
		_FresnelColor("Fresnel Color", Color) = (0.8490566,0.8490566,0.8490566,0)
		_ParallaxMap("Hdetm", 2D) = "black" {}
		_Parallax("Height Multiplier", Range( -0.25 , 1)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
		[Header(Forward Rendering Options)]
		[ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		[ToggleOff] _GlossyReflections("Reflections", Float) = 1.0
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGINCLUDE
		#include "UnityStandardUtils.cginc"
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#pragma multi_compile_instancing
		#pragma shader_feature _SPECULARHIGHLIGHTS_OFF
		#pragma shader_feature _GLOSSYREFLECTIONS_OFF
		#ifdef UNITY_PASS_SHADOWCASTER
			#undef INTERNAL_DATA
			#undef WorldReflectionVector
			#undef WorldNormalVector
			#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
			#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
			#define WorldNormalVector(data,normal) half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))
		#endif
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
			float3 worldNormal;
			INTERNAL_DATA
		};

		uniform sampler2D _ParallaxMap;
		uniform sampler2D _BumpMap;
		uniform sampler2D _DetailNormalMap;
		uniform sampler2D _MainTex;
		uniform sampler2D _DetailAlbedoMap;
		uniform float _OneMinus;
		uniform float _EMISSION;
		uniform sampler2D _EmissionMap;
		uniform sampler2D _SpecGlossMap;

		UNITY_INSTANCING_BUFFER_START(HaloToolsHalo2AnniversaryStandard)
			UNITY_DEFINE_INSTANCED_PROP(float4, _ZoneColor)
#define _ZoneColor_arr HaloToolsHalo2AnniversaryStandard
			UNITY_DEFINE_INSTANCED_PROP(float4, _ParallaxMap_ST)
#define _ParallaxMap_ST_arr HaloToolsHalo2AnniversaryStandard
			UNITY_DEFINE_INSTANCED_PROP(float4, _BumpMap_ST)
#define _BumpMap_ST_arr HaloToolsHalo2AnniversaryStandard
			UNITY_DEFINE_INSTANCED_PROP(float4, _FresnelColor)
#define _FresnelColor_arr HaloToolsHalo2AnniversaryStandard
			UNITY_DEFINE_INSTANCED_PROP(float4, _DetailNormalMap_ST)
#define _DetailNormalMap_ST_arr HaloToolsHalo2AnniversaryStandard
			UNITY_DEFINE_INSTANCED_PROP(float4, _MainTex_ST)
#define _MainTex_ST_arr HaloToolsHalo2AnniversaryStandard
			UNITY_DEFINE_INSTANCED_PROP(float4, _DetailAlbedoMap_ST)
#define _DetailAlbedoMap_ST_arr HaloToolsHalo2AnniversaryStandard
			UNITY_DEFINE_INSTANCED_PROP(float4, _SpecGlossMap_ST)
#define _SpecGlossMap_ST_arr HaloToolsHalo2AnniversaryStandard
			UNITY_DEFINE_INSTANCED_PROP(float4, _EmissionMap_ST)
#define _EmissionMap_ST_arr HaloToolsHalo2AnniversaryStandard
			UNITY_DEFINE_INSTANCED_PROP(float4, _EmissionColor)
#define _EmissionColor_arr HaloToolsHalo2AnniversaryStandard
			UNITY_DEFINE_INSTANCED_PROP(float, _FresnelPower)
#define _FresnelPower_arr HaloToolsHalo2AnniversaryStandard
			UNITY_DEFINE_INSTANCED_PROP(float, _FresnelScale)
#define _FresnelScale_arr HaloToolsHalo2AnniversaryStandard
			UNITY_DEFINE_INSTANCED_PROP(float, _Parallax)
#define _Parallax_arr HaloToolsHalo2AnniversaryStandard
			UNITY_DEFINE_INSTANCED_PROP(float, _DetailNormalIntensity)
#define _DetailNormalIntensity_arr HaloToolsHalo2AnniversaryStandard
			UNITY_DEFINE_INSTANCED_PROP(float, _BumpScale)
#define _BumpScale_arr HaloToolsHalo2AnniversaryStandard
			UNITY_DEFINE_INSTANCED_PROP(float, _EmissionIntensity)
#define _EmissionIntensity_arr HaloToolsHalo2AnniversaryStandard
			UNITY_DEFINE_INSTANCED_PROP(float, _GlossMapScale)
#define _GlossMapScale_arr HaloToolsHalo2AnniversaryStandard
		UNITY_INSTANCING_BUFFER_END(HaloToolsHalo2AnniversaryStandard)

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float _Parallax_Instance = UNITY_ACCESS_INSTANCED_PROP(_Parallax_arr, _Parallax);
			float4 _ParallaxMap_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_ParallaxMap_ST_arr, _ParallaxMap_ST);
			float2 uv_ParallaxMap = v.texcoord * _ParallaxMap_ST_Instance.xy + _ParallaxMap_ST_Instance.zw;
			float3 ase_vertexNormal = v.normal.xyz;
			v.vertex.xyz += ( (0.0 + (_Parallax_Instance - 0.0) * (0.0005 - 0.0) / (1.0 - 0.0)) * tex2Dlod( _ParallaxMap, float4( uv_ParallaxMap, 0, 0.0) ) * float4( ase_vertexNormal , 0.0 ) ).rgb;
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandardSpecular o )
		{
			float4 _BumpMap_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_BumpMap_ST_arr, _BumpMap_ST);
			float2 uv_BumpMap = i.uv_texcoord * _BumpMap_ST_Instance.xy + _BumpMap_ST_Instance.zw;
			float _BumpScale_Instance = UNITY_ACCESS_INSTANCED_PROP(_BumpScale_arr, _BumpScale);
			float4 _DetailNormalMap_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_DetailNormalMap_ST_arr, _DetailNormalMap_ST);
			float2 uv_DetailNormalMap = i.uv_texcoord * _DetailNormalMap_ST_Instance.xy + _DetailNormalMap_ST_Instance.zw;
			float _DetailNormalIntensity_Instance = UNITY_ACCESS_INSTANCED_PROP(_DetailNormalIntensity_arr, _DetailNormalIntensity);
			float3 clampResult24 = clamp( ( UnpackScaleNormal( tex2D( _BumpMap, uv_BumpMap ), _BumpScale_Instance ) + UnpackScaleNormal( tex2D( _DetailNormalMap, uv_DetailNormalMap ), _DetailNormalIntensity_Instance ) ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 Normal61 = clampResult24;
			o.Normal = Normal61;
			float4 _MainTex_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_MainTex_ST_arr, _MainTex_ST);
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST_Instance.xy + _MainTex_ST_Instance.zw;
			float4 tex2DNode1 = tex2D( _MainTex, uv_MainTex );
			float4 _DetailAlbedoMap_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_DetailAlbedoMap_ST_arr, _DetailAlbedoMap_ST);
			float2 uv_DetailAlbedoMap = i.uv_texcoord * _DetailAlbedoMap_ST_Instance.xy + _DetailAlbedoMap_ST_Instance.zw;
			float4 _ZoneColor_Instance = UNITY_ACCESS_INSTANCED_PROP(_ZoneColor_arr, _ZoneColor);
			float4 temp_output_81_0 = ( _ZoneColor_Instance * tex2DNode1.a );
			float3 desaturateInitialColor44 = ( tex2DNode1 * tex2D( _DetailAlbedoMap, uv_DetailAlbedoMap ) * ( temp_output_81_0 + (( _OneMinus )?( ( tex2DNode1 * float4( -1,-1,-1,-1 ) ) ):( ( 1.0 - tex2DNode1 ) )) ) ).rgb;
			float desaturateDot44 = dot( desaturateInitialColor44, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar44 = lerp( desaturateInitialColor44, desaturateDot44.xxx, -0.75 );
			float3 Albedo58 = desaturateVar44;
			o.Albedo = Albedo58;
			float4 _EmissionMap_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_EmissionMap_ST_arr, _EmissionMap_ST);
			float2 uv_EmissionMap = i.uv_texcoord * _EmissionMap_ST_Instance.xy + _EmissionMap_ST_Instance.zw;
			float _EmissionIntensity_Instance = UNITY_ACCESS_INSTANCED_PROP(_EmissionIntensity_arr, _EmissionIntensity);
			float4 _EmissionColor_Instance = UNITY_ACCESS_INSTANCED_PROP(_EmissionColor_arr, _EmissionColor);
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float _FresnelScale_Instance = UNITY_ACCESS_INSTANCED_PROP(_FresnelScale_arr, _FresnelScale);
			float _FresnelPower_Instance = UNITY_ACCESS_INSTANCED_PROP(_FresnelPower_arr, _FresnelPower);
			float fresnelNdotV13 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode13 = ( 0.0 + _FresnelScale_Instance * pow( 1.0 - fresnelNdotV13, _FresnelPower_Instance ) );
			float4 _FresnelColor_Instance = UNITY_ACCESS_INSTANCED_PROP(_FresnelColor_arr, _FresnelColor);
			float4 Emission63 = ( (( _EMISSION )?( ( tex2D( _EmissionMap, uv_EmissionMap ) * _EmissionIntensity_Instance * _EmissionColor_Instance ) ):( float4( 0,0,0,0 ) )) + ( fresnelNode13 * _FresnelColor_Instance ) );
			o.Emission = Emission63.rgb;
			float4 _SpecGlossMap_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_SpecGlossMap_ST_arr, _SpecGlossMap_ST);
			float2 uv_SpecGlossMap = i.uv_texcoord * _SpecGlossMap_ST_Instance.xy + _SpecGlossMap_ST_Instance.zw;
			float4 tex2DNode78 = tex2D( _SpecGlossMap, uv_SpecGlossMap );
			o.Specular = ( ( temp_output_81_0 * tex2DNode78 ) + ( (1.0 + (tex2DNode1.a - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) * tex2DNode78 ) ).rgb;
			float _GlossMapScale_Instance = UNITY_ACCESS_INSTANCED_PROP(_GlossMapScale_arr, _GlossMapScale);
			o.Smoothness = (0.0 + (_GlossMapScale_Instance - 0.0) * (0.75 - 0.0) / (1.0 - 0.0));
			o.Alpha = 1;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf StandardSpecular keepalpha fullforwardshadows vertex:vertexDataFunc 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float4 tSpace0 : TEXCOORD2;
				float4 tSpace1 : TEXCOORD3;
				float4 tSpace2 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				vertexDataFunc( v, customInputData );
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				half3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
				half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				half3 worldBinormal = cross( worldNormal, worldTangent ) * tangentSign;
				o.tSpace0 = float4( worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x );
				o.tSpace1 = float4( worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y );
				o.tSpace2 = float4( worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z );
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				float3 worldPos = float3( IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w );
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = float3( IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z );
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				SurfaceOutputStandardSpecular o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputStandardSpecular, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Standard (Specular setup)"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18800
330.6667;720;1280;659;2180.453;33.52762;1.842098;True;False
Node;AmplifyShaderEditor.CommentaryNode;67;-1393.515,-816;Inherit;False;1161.517;704.6202;Albedo;10;73;58;44;1;6;81;87;90;96;105;;0.1153229,1,0,1;0;0
Node;AmplifyShaderEditor.SamplerNode;1;-1286.624,-532.3815;Inherit;True;Property;_MainTex;Albedo;2;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;96;-959.2817,-441.218;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;-1,-1,-1,-1;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;90;-967.8043,-555.4665;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;73;-1296,-768;Inherit;False;InstancedProperty;_ZoneColor;Zone Color;1;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;66;-1394.173,-96;Inherit;False;1166.578;457.8495;Normal;7;61;24;22;2;53;11;69;;0.7881236,0,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;65;-1378.98,396.3418;Inherit;False;1169.925;522.8179;Emission;11;63;16;72;17;19;13;71;3;118;14;15;;0,0.7555048,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;69;-1280,176;Inherit;False;InstancedProperty;_DetailNormalIntensity;Detail Normal Intensity;13;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-1232,-64;Inherit;False;InstancedProperty;_BumpScale;Normal Intensity;6;0;Create;False;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-1345.241,476.9019;Inherit;False;InstancedProperty;_FresnelScale;Fresnel Scale;15;0;Create;True;0;0;0;False;0;False;0.015;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;71;-592,544;Inherit;False;InstancedProperty;_EmissionIntensity;Emission Intensity;10;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3;-869.4906,432.6515;Inherit;True;Property;_EmissionMap;Emission;9;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;118;-576,752;Inherit;False;InstancedProperty;_EmissionColor;Emission Color;8;0;Create;False;0;0;0;False;0;False;1,1,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;14;-1349.241,557.9021;Inherit;False;InstancedProperty;_FresnelPower;Fresnel Power;14;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;105;-794.6799,-786.7185;Inherit;False;Property;_OneMinus;OneMinus;0;0;Create;True;0;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;81;-1063.009,-769.0159;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;19;-1109.491,640.6516;Inherit;False;InstancedProperty;_FresnelColor;Fresnel Color;16;0;Create;True;0;0;0;False;0;False;0.8490566,0.8490566,0.8490566,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FresnelNode;13;-1132.488,459.7936;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;127;-1376.491,927.09;Inherit;False;1155.199;467.7211;Hdetm (Height);5;122;126;121;125;123;;1,0,0,1;0;0
Node;AmplifyShaderEditor.SamplerNode;6;-1286.624,-340.3815;Inherit;True;Property;_DetailAlbedoMap;Detail Albedo;11;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-1048.146,-64.42409;Inherit;True;Property;_BumpMap;Normal;5;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;87;-596.2545,-777.0424;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;53;-1056,128;Inherit;True;Property;_DetailNormalMap;Detail Normal;12;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;72;-368,432;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;123;-1071.493,985.4866;Inherit;False;InstancedProperty;_Parallax;Height Multiplier;18;0;Create;False;0;0;0;False;0;False;0;0;-0.25;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;92;-670.1091,-465.1528;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;22;-731.3511,4.748802;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;-837.491,640.6516;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;119;-221.8755,262.9338;Inherit;False;341;240;Metallics are stored in the alpha channel;1;78;unused;1,1,1,1;0;0
Node;AmplifyShaderEditor.ToggleSwitchNode;130;-251.2731,532.6979;Inherit;False;Property;_EMISSION;Toggle Emission;7;0;Create;False;0;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DesaturateOpNode;44;-519.6486,-557.6272;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;-0.75;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalVertexDataNode;125;-447.2131,1229.992;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;78;-187,304.955;Inherit;True;Property;_SpecGlossMap;Specular;3;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;16;-533.4916,640.6516;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;126;-799.4929,985.4866;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.0005;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;24;-594.1724,-1.430511E-06;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;116;-893.1907,-310.907;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;121;-915.3577,1140.399;Inherit;True;Property;_ParallaxMap;Hdetm;17;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;122;-555.6033,1142.766;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;94;144,305.955;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;4;-48,80;Inherit;False;InstancedProperty;_GlossMapScale;Smoothness;4;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;61;-425.4834,6.533936;Inherit;False;Normal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;58;-513.1927,-433.1508;Inherit;False;Albedo;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;113;145.5313,438.4479;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;63;-405.4918,640.6516;Inherit;False;Emission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;128;214.7701,145.3162;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;62;216,-4;Inherit;False;61;Normal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;64;216,76;Inherit;False;63;Emission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;124;351.0215,848.4376;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;60;216,-84;Inherit;False;58;Albedo;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;114;285.5313,368.4479;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;436.7308,-19.16853;Float;False;True;-1;2;ASEMaterialInspector;0;0;StandardSpecular;Halo Tools/Halo 2 Anniversary/Standard;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;Standard (Specular setup);-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;96;0;1;0
WireConnection;90;0;1;0
WireConnection;105;0;90;0
WireConnection;105;1;96;0
WireConnection;81;0;73;0
WireConnection;81;1;1;4
WireConnection;13;2;15;0
WireConnection;13;3;14;0
WireConnection;2;5;11;0
WireConnection;87;0;81;0
WireConnection;87;1;105;0
WireConnection;53;5;69;0
WireConnection;72;0;3;0
WireConnection;72;1;71;0
WireConnection;72;2;118;0
WireConnection;92;0;1;0
WireConnection;92;1;6;0
WireConnection;92;2;87;0
WireConnection;22;0;2;0
WireConnection;22;1;53;0
WireConnection;17;0;13;0
WireConnection;17;1;19;0
WireConnection;130;1;72;0
WireConnection;44;0;92;0
WireConnection;16;0;130;0
WireConnection;16;1;17;0
WireConnection;126;0;123;0
WireConnection;24;0;22;0
WireConnection;116;0;1;4
WireConnection;122;0;126;0
WireConnection;122;1;121;0
WireConnection;122;2;125;0
WireConnection;94;0;81;0
WireConnection;94;1;78;0
WireConnection;61;0;24;0
WireConnection;58;0;44;0
WireConnection;113;0;116;0
WireConnection;113;1;78;0
WireConnection;63;0;16;0
WireConnection;128;0;4;0
WireConnection;124;0;122;0
WireConnection;114;0;94;0
WireConnection;114;1;113;0
WireConnection;0;0;60;0
WireConnection;0;1;62;0
WireConnection;0;2;64;0
WireConnection;0;3;114;0
WireConnection;0;4;128;0
WireConnection;0;11;124;0
ASEEND*/
//CHKSM=AB0F8763506B24627B1D84831104BD26EE015429