Shader "normal_convert" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
    }
    SubShader {
        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            uniform sampler2D _MainTex;

            struct input {
                float4 pos : POSITION;
                float2 uv0 : TEXCOORD0;
            };
            struct v2f {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };

            v2f vert (input v) {
                v2f o = (v2f)0;
                o.uv0 = v.uv0;
                o.pos = UnityObjectToClipPos(v.pos);
                return o;
            }

            float4 frag(v2f i) : COLOR {
                float4 nrm = tex2D(_MainTex, i.uv0);
                nrm.r = 1;
                return nrm;
            }
            ENDCG
        }
    }
}