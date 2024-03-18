ﬁ
äC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\App_Start\BundleConfig.cs
	namespace 	
proyectoTEA
 
{ 
public 
class 
BundleConfig 
{ 
public		 
static			 
void		 
RegisterBundles		 $
(		$ %
BundleCollection		% 5
bundles		6 =
)		= >
{

 
bundles 

.
 
Add 
( 
new 
ScriptBundle 
(  
$str  2
)2 3
.3 4
Include4 ;
(; <
$str %
)% &
)& '
;' (
bundles 

.
 
Add 
( 
new 
ScriptBundle 
(  
$str  5
)5 6
.6 7
Include7 >
(> ?
$str 
) 
) 
;  
bundles 

.
 
Add 
( 
new 
ScriptBundle 
(  
$str  5
)5 6
.6 7
Include7 >
(> ?
$str 
)  
)  !
;! "
bundles 

.
 
Add 
( 
new 
StyleBundle 
( 
$str .
). /
./ 0
Include0 7
(7 8
$str  
,  !
$str 
) 
) 
; 
} 
} 
} π
äC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\App_Start\FilterConfig.cs
	namespace 	
proyectoTEA
 
{ 
public 
class 
FilterConfig 
{ 
public 
static	 
void !
RegisterGlobalFilters *
(* +"
GlobalFilterCollection+ A
filtersB I
)I J
{		 
filters

 

.


 
Add

 
(

 
new

  
HandleErrorAttribute

 '
(

' (
)

( )
)

) *
;

* +
} 
} 
} ó	
âC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\App_Start\RouteConfig.cs
	namespace 	
proyectoTEA
 
{		 
public

 
class

 
RouteConfig

 
{ 
public 
static	 
void 
RegisterRoutes #
(# $
RouteCollection$ 3
routes4 :
): ;
{ 
routes 	
.	 

IgnoreRoute
 
( 
$str 2
)2 3
;3 4
routes 	
.	 

MapRoute
 
( 
name 
: 	
$str
 
, 
url 
: 
$str	 %
,% &
defaults 
: 
new 
{ 

controller 
=  
$str! '
,' (
action) /
=0 1
$str2 9
,9 :
id; =
=> ?
UrlParameter@ L
.L M
OptionalM U
}V W
) 
; 
} 
} 
} ±	
äC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\App_Start\WebApiConfig.cs
	namespace 	
proyectoTEA
 
{ 
public 
static 
class 
WebApiConfig !
{		 
public

 
static

	 
void

 
Register

 
(

 
HttpConfiguration

 /
config

0 6
)

6 7
{ 
config 	
.	 


EnableCors
 
( 
) 
; 
config 	
.	 
"
MapHttpAttributeRoutes
  
(  !
)! "
;" #
config 	
.	 

Routes
 
. 
MapHttpRoute 
( 
name 
: 	
$str
 
, 
routeTemplate 
: 
$str *
,* +
defaults 
: 
new 
{ 
id 
= 
RouteParameter '
.' (
Optional( 0
}1 2
) 
; 
} 
} 
}  
õC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\ApiDescriptionExtensions.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
{ 
public 

static 
class $
ApiDescriptionExtensions 0
{		 
public 
static 
string 
GetFriendlyId *
(* +
this+ /
ApiDescription0 >
description? J
)J K
{ 	
string 
path 
= 
description %
.% &
RelativePath& 2
;2 3
string 
[ 
] 
urlParts 
= 
path  $
.$ %
Split% *
(* +
$char+ .
). /
;/ 0
string 
	localPath 
= 
urlParts '
[' (
$num( )
]) *
;* +
string 
queryKeyString !
=" #
null$ (
;( )
if 
( 
urlParts 
. 
Length 
>  !
$num" #
)# $
{ 
string 
query 
= 
urlParts '
[' (
$num( )
]) *
;* +
string 
[ 
] 
	queryKeys "
=# $
HttpUtility% 0
.0 1
ParseQueryString1 A
(A B
queryB G
)G H
.H I
AllKeysI P
;P Q
queryKeyString 
=  
String! '
.' (
Join( ,
(, -
$str- 0
,0 1
	queryKeys2 ;
); <
;< =
} 
StringBuilder 
friendlyPath &
=' (
new) ,
StringBuilder- :
(: ;
); <
;< =
friendlyPath 
. 
AppendFormat %
(% &
$str& /
,/ 0
description 
. 

HttpMethod &
.& '
Method' -
,- .
	localPath 
. 
Replace !
(! "
$str" %
,% &
$str' *
)* +
.+ ,
Replace, 3
(3 4
$str4 7
,7 8
String9 ?
.? @
Empty@ E
)E F
.F G
ReplaceG N
(N O
$strO R
,R S
StringT Z
.Z [
Empty[ `
)` a
)a b
;b c
if   
(   
queryKeyString   
!=   !
null  " &
)  & '
{!! 
friendlyPath"" 
."" 
AppendFormat"" )
("") *
$str""* 0
,""0 1
queryKeyString""2 @
.""@ A
Replace""A H
(""H I
$char""I L
,""L M
$char""N Q
)""Q R
)""R S
;""S T
}## 
return$$ 
friendlyPath$$ 
.$$  
ToString$$  (
($$( )
)$$) *
;$$* +
}%% 	
}&& 
}'' €
õC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\App_Start\HelpPageConfig.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
{ 
public 

static 
class 
HelpPageConfig &
{ 
[ 	
SuppressMessage	 
( 
$str 2
,2 3
$str4 i
,i j
	MessageId 
= 
$str T
,T U
Justification 
= 
$str j
)j k
]k l
[ 	
SuppressMessage	 
( 
$str +
,+ ,
$str- Z
,Z [
	MessageId   
=   
$str   "
,  " #
Justification!! 
=!! 
$str!! ,
)!!, -
]!!- .
public"" 
static"" 
void"" 
Register"" #
(""# $
HttpConfiguration""$ 5
config""6 <
)""< =
{## 	
config:: 
.:: !
SetSampleForMediaType:: (
(::( )
new;; 

TextSample;; 
(;; 
$str;; Z
);;Z [
,;;[ \
new<<  
MediaTypeHeaderValue<< (
(<<( )
$str<<) ;
)<<; <
)<<< =
;<<= >
}QQ 	
}pp 
}qq €
ùC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\Controllers\HelpController.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
.$ %
Controllers% 0
{ 
public 

class 
HelpController 
:  !

Controller" ,
{ 
private 
const 
string 
ErrorViewName *
=+ ,
$str- 4
;4 5
public 
HelpController 
( 
) 
: 
this 
( 
GlobalConfiguration &
.& '
Configuration' 4
)4 5
{ 	
} 	
public 
HelpController 
( 
HttpConfiguration /
config0 6
)6 7
{ 	
Configuration 
= 
config "
;" #
} 	
public 
HttpConfiguration  
Configuration! .
{/ 0
get1 4
;4 5
private6 =
set> A
;A B
}C D
public 
ActionResult 
Index !
(! "
)" #
{ 	
ViewBag 
. !
DocumentationProvider )
=* +
Configuration, 9
.9 :
Services: B
.B C$
GetDocumentationProviderC [
([ \
)\ ]
;] ^
return 
View 
( 
Configuration %
.% &
Services& .
.. /
GetApiExplorer/ =
(= >
)> ?
.? @
ApiDescriptions@ O
)O P
;P Q
}   	
public"" 
ActionResult"" 
Api"" 
(""  
string""  &
apiId""' ,
)"", -
{## 	
if$$ 
($$ 
!$$ 
String$$ 
.$$ 
IsNullOrEmpty$$ %
($$% &
apiId$$& +
)$$+ ,
)$$, -
{%% 
HelpPageApiModel&&  
apiModel&&! )
=&&* +
Configuration&&, 9
.&&9 :
GetHelpPageApiModel&&: M
(&&M N
apiId&&N S
)&&S T
;&&T U
if'' 
('' 
apiModel'' 
!='' 
null''  $
)''$ %
{(( 
return)) 
View)) 
())  
apiModel))  (
)))( )
;))) *
}** 
}++ 
return-- 
View-- 
(-- 
ErrorViewName-- %
)--% &
;--& '
}.. 	
public00 
ActionResult00 
ResourceModel00 )
(00) *
string00* 0
	modelName001 :
)00: ;
{11 	
if22 
(22 
!22 
String22 
.22 
IsNullOrEmpty22 %
(22% &
	modelName22& /
)22/ 0
)220 1
{33 %
ModelDescriptionGenerator44 )%
modelDescriptionGenerator44* C
=44D E
Configuration44F S
.44S T(
GetModelDescriptionGenerator44T p
(44p q
)44q r
;44r s
ModelDescription55  
modelDescription55! 1
;551 2
if66 
(66 %
modelDescriptionGenerator66 -
.66- .
GeneratedModels66. =
.66= >
TryGetValue66> I
(66I J
	modelName66J S
,66S T
out66U X
modelDescription66Y i
)66i j
)66j k
{77 
return88 
View88 
(88  
modelDescription88  0
)880 1
;881 2
}99 
}:: 
return<< 
View<< 
(<< 
ErrorViewName<< %
)<<% &
;<<& '
}== 	
}>> 
}?? Â
õC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\HelpPageAreaRegistration.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
{ 
public 

class $
HelpPageAreaRegistration )
:* +
AreaRegistration, <
{ 
public 
override 
string 
AreaName '
{		 	
get

 
{ 
return 
$str !
;! "
} 
} 	
public 
override 
void 
RegisterArea )
() *#
AreaRegistrationContext* A
contextB I
)I J
{ 	
context 
. 
MapRoute 
( 
$str "
," #
$str '
,' (
new 
{ 

controller  
=! "
$str# )
,) *
action+ 1
=2 3
$str4 ;
,; <
apiId= B
=C D
UrlParameterE Q
.Q R
OptionalR Z
}[ \
)\ ]
;] ^
HelpPageConfig 
. 
Register #
(# $
GlobalConfiguration$ 7
.7 8
Configuration8 E
)E F
;F G
} 	
} 
} —≥
¢C:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\HelpPageConfigurationExtensions.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
{ 
public 

static 
class +
HelpPageConfigurationExtensions 7
{ 
private 
const 
string 
ApiModelPrefix +
=, -
$str. D
;D E
public 
static 
void $
SetDocumentationProvider 3
(3 4
this4 8
HttpConfiguration9 J
configK Q
,Q R"
IDocumentationProviderS i!
documentationProviderj 
)	 Ä
{ 	
config 
. 
Services 
. 
Replace #
(# $
typeof$ *
(* +"
IDocumentationProvider+ A
)A B
,B C!
documentationProviderD Y
)Y Z
;Z [
} 	
public&& 
static&& 
void&& 
SetSampleObjects&& +
(&&+ ,
this&&, 0
HttpConfiguration&&1 B
config&&C I
,&&I J
IDictionary&&K V
<&&V W
Type&&W [
,&&[ \
object&&] c
>&&c d
sampleObjects&&e r
)&&r s
{'' 	
config(( 
.(( &
GetHelpPageSampleGenerator(( -
(((- .
)((. /
.((/ 0
SampleObjects((0 =
=((> ?
sampleObjects((@ M
;((M N
})) 	
public33 
static33 
void33 
SetSampleRequest33 +
(33+ ,
this33, 0
HttpConfiguration331 B
config33C I
,33I J
object33K Q
sample33R X
,33X Y 
MediaTypeHeaderValue33Z n
	mediaType33o x
,33x y
string	33z Ä
controllerName
33Å è
,
33è ê
string
33ë ó

actionName
33ò ¢
)
33¢ £
{44 	
config55 
.55 &
GetHelpPageSampleGenerator55 -
(55- .
)55. /
.55/ 0
ActionSamples550 =
.55= >
Add55> A
(55A B
new55B E
HelpPageSampleKey55F W
(55W X
	mediaType55X a
,55a b
SampleDirection55c r
.55r s
Request55s z
,55z {
controllerName	55| ä
,
55ä ã

actionName
55å ñ
,
55ñ ó
new
55ò õ
[
55õ ú
]
55ú ù
{
55û ü
$str
55† £
}
55§ •
)
55• ¶
,
55¶ ß
sample
55® Æ
)
55Æ Ø
;
55Ø ∞
}66 	
publicAA 
staticAA 
voidAA 
SetSampleRequestAA +
(AA+ ,
thisAA, 0
HttpConfigurationAA1 B
configAAC I
,AAI J
objectAAK Q
sampleAAR X
,AAX Y 
MediaTypeHeaderValueAAZ n
	mediaTypeAAo x
,AAx y
string	AAz Ä
controllerName
AAÅ è
,
AAè ê
string
AAë ó

actionName
AAò ¢
,
AA¢ £
params
AA§ ™
string
AA´ ±
[
AA± ≤
]
AA≤ ≥
parameterNames
AA¥ ¬
)
AA¬ √
{BB 	
configCC 
.CC &
GetHelpPageSampleGeneratorCC -
(CC- .
)CC. /
.CC/ 0
ActionSamplesCC0 =
.CC= >
AddCC> A
(CCA B
newCCB E
HelpPageSampleKeyCCF W
(CCW X
	mediaTypeCCX a
,CCa b
SampleDirectionCCc r
.CCr s
RequestCCs z
,CCz {
controllerName	CC| ä
,
CCä ã

actionName
CCå ñ
,
CCñ ó
parameterNames
CCò ¶
)
CC¶ ß
,
CCß ®
sample
CC© Ø
)
CCØ ∞
;
CC∞ ±
}DD 	
publicNN 
staticNN 
voidNN 
SetSampleResponseNN ,
(NN, -
thisNN- 1
HttpConfigurationNN2 C
configNND J
,NNJ K
objectNNL R
sampleNNS Y
,NNY Z 
MediaTypeHeaderValueNN[ o
	mediaTypeNNp y
,NNy z
string	NN{ Å
controllerName
NNÇ ê
,
NNê ë
string
NNí ò

actionName
NNô £
)
NN£ §
{OO 	
configPP 
.PP &
GetHelpPageSampleGeneratorPP -
(PP- .
)PP. /
.PP/ 0
ActionSamplesPP0 =
.PP= >
AddPP> A
(PPA B
newPPB E
HelpPageSampleKeyPPF W
(PPW X
	mediaTypePPX a
,PPa b
SampleDirectionPPc r
.PPr s
ResponsePPs {
,PP{ |
controllerName	PP} ã
,
PPã å

actionName
PPç ó
,
PPó ò
new
PPô ú
[
PPú ù
]
PPù û
{
PPü †
$str
PP° §
}
PP• ¶
)
PP¶ ß
,
PPß ®
sample
PP© Ø
)
PPØ ∞
;
PP∞ ±
}QQ 	
public\\ 
static\\ 
void\\ 
SetSampleResponse\\ ,
(\\, -
this\\- 1
HttpConfiguration\\2 C
config\\D J
,\\J K
object\\L R
sample\\S Y
,\\Y Z 
MediaTypeHeaderValue\\[ o
	mediaType\\p y
,\\y z
string	\\{ Å
controllerName
\\Ç ê
,
\\ê ë
string
\\í ò

actionName
\\ô £
,
\\£ §
params
\\• ´
string
\\¨ ≤
[
\\≤ ≥
]
\\≥ ¥
parameterNames
\\µ √
)
\\√ ƒ
{]] 	
config^^ 
.^^ &
GetHelpPageSampleGenerator^^ -
(^^- .
)^^. /
.^^/ 0
ActionSamples^^0 =
.^^= >
Add^^> A
(^^A B
new^^B E
HelpPageSampleKey^^F W
(^^W X
	mediaType^^X a
,^^a b
SampleDirection^^c r
.^^r s
Response^^s {
,^^{ |
controllerName	^^} ã
,
^^ã å

actionName
^^ç ó
,
^^ó ò
parameterNames
^^ô ß
)
^^ß ®
,
^^® ©
sample
^^™ ∞
)
^^∞ ±
;
^^± ≤
}__ 	
publicgg 
staticgg 
voidgg !
SetSampleForMediaTypegg 0
(gg0 1
thisgg1 5
HttpConfigurationgg6 G
configggH N
,ggN O
objectggP V
sampleggW ]
,gg] ^ 
MediaTypeHeaderValuegg_ s
	mediaTypeggt }
)gg} ~
{hh 	
configii 
.ii &
GetHelpPageSampleGeneratorii -
(ii- .
)ii. /
.ii/ 0
ActionSamplesii0 =
.ii= >
Addii> A
(iiA B
newiiB E
HelpPageSampleKeyiiF W
(iiW X
	mediaTypeiiX a
)iia b
,iib c
sampleiid j
)iij k
;iik l
}jj 	
publicss 
staticss 
voidss 
SetSampleForTypess +
(ss+ ,
thisss, 0
HttpConfigurationss1 B
configssC I
,ssI J
objectssK Q
samplessR X
,ssX Y 
MediaTypeHeaderValuessZ n
	mediaTypesso x
,ssx y
Typessz ~
type	ss É
)
ssÉ Ñ
{tt 	
configuu 
.uu &
GetHelpPageSampleGeneratoruu -
(uu- .
)uu. /
.uu/ 0
ActionSamplesuu0 =
.uu= >
Adduu> A
(uuA B
newuuB E
HelpPageSampleKeyuuF W
(uuW X
	mediaTypeuuX a
,uua b
typeuuc g
)uug h
,uuh i
sampleuuj p
)uup q
;uuq r
}vv 	
public
ÄÄ 
static
ÄÄ 
void
ÄÄ "
SetActualRequestType
ÄÄ /
(
ÄÄ/ 0
this
ÄÄ0 4
HttpConfiguration
ÄÄ5 F
config
ÄÄG M
,
ÄÄM N
Type
ÄÄO S
type
ÄÄT X
,
ÄÄX Y
string
ÄÄZ `
controllerName
ÄÄa o
,
ÄÄo p
string
ÄÄq w

actionNameÄÄx Ç
)ÄÄÇ É
{
ÅÅ 	
config
ÇÇ 
.
ÇÇ (
GetHelpPageSampleGenerator
ÇÇ -
(
ÇÇ- .
)
ÇÇ. /
.
ÇÇ/ 0$
ActualHttpMessageTypes
ÇÇ0 F
.
ÇÇF G
Add
ÇÇG J
(
ÇÇJ K
new
ÇÇK N
HelpPageSampleKey
ÇÇO `
(
ÇÇ` a
SampleDirection
ÇÇa p
.
ÇÇp q
Request
ÇÇq x
,
ÇÇx y
controllerNameÇÇz à
,ÇÇà â

actionNameÇÇä î
,ÇÇî ï
newÇÇñ ô
[ÇÇô ö
]ÇÇö õ
{ÇÇú ù
$strÇÇû °
}ÇÇ¢ £
)ÇÇ£ §
,ÇÇ§ •
typeÇÇ¶ ™
)ÇÇ™ ´
;ÇÇ´ ¨
}
ÉÉ 	
public
éé 
static
éé 
void
éé "
SetActualRequestType
éé /
(
éé/ 0
this
éé0 4
HttpConfiguration
éé5 F
config
ééG M
,
ééM N
Type
ééO S
type
ééT X
,
ééX Y
string
ééZ `
controllerName
ééa o
,
ééo p
string
ééq w

actionNameééx Ç
,ééÇ É
paramsééÑ ä
stringééã ë
[ééë í
]ééí ì
parameterNamesééî ¢
)éé¢ £
{
èè 	
config
êê 
.
êê (
GetHelpPageSampleGenerator
êê -
(
êê- .
)
êê. /
.
êê/ 0$
ActualHttpMessageTypes
êê0 F
.
êêF G
Add
êêG J
(
êêJ K
new
êêK N
HelpPageSampleKey
êêO `
(
êê` a
SampleDirection
êêa p
.
êêp q
Request
êêq x
,
êêx y
controllerNameêêz à
,êêà â

actionNameêêä î
,êêî ï
parameterNamesêêñ §
)êê§ •
,êê• ¶
typeêêß ´
)êê´ ¨
;êê¨ ≠
}
ëë 	
public
õõ 
static
õõ 
void
õõ #
SetActualResponseType
õõ 0
(
õõ0 1
this
õõ1 5
HttpConfiguration
õõ6 G
config
õõH N
,
õõN O
Type
õõP T
type
õõU Y
,
õõY Z
string
õõ[ a
controllerName
õõb p
,
õõp q
string
õõr x

actionNameõõy É
)õõÉ Ñ
{
úú 	
config
ùù 
.
ùù (
GetHelpPageSampleGenerator
ùù -
(
ùù- .
)
ùù. /
.
ùù/ 0$
ActualHttpMessageTypes
ùù0 F
.
ùùF G
Add
ùùG J
(
ùùJ K
new
ùùK N
HelpPageSampleKey
ùùO `
(
ùù` a
SampleDirection
ùùa p
.
ùùp q
Response
ùùq y
,
ùùy z
controllerNameùù{ â
,ùùâ ä

actionNameùùã ï
,ùùï ñ
newùùó ö
[ùùö õ
]ùùõ ú
{ùùù û
$strùùü ¢
}ùù£ §
)ùù§ •
,ùù• ¶
typeùùß ´
)ùù´ ¨
;ùù¨ ≠
}
ûû 	
public
©© 
static
©© 
void
©© #
SetActualResponseType
©© 0
(
©©0 1
this
©©1 5
HttpConfiguration
©©6 G
config
©©H N
,
©©N O
Type
©©P T
type
©©U Y
,
©©Y Z
string
©©[ a
controllerName
©©b p
,
©©p q
string
©©r x

actionName©©y É
,©©É Ñ
params©©Ö ã
string©©å í
[©©í ì
]©©ì î
parameterNames©©ï £
)©©£ §
{
™™ 	
config
´´ 
.
´´ (
GetHelpPageSampleGenerator
´´ -
(
´´- .
)
´´. /
.
´´/ 0$
ActualHttpMessageTypes
´´0 F
.
´´F G
Add
´´G J
(
´´J K
new
´´K N
HelpPageSampleKey
´´O `
(
´´` a
SampleDirection
´´a p
.
´´p q
Response
´´q y
,
´´y z
controllerName´´{ â
,´´â ä

actionName´´ã ï
,´´ï ñ
parameterNames´´ó •
)´´• ¶
,´´¶ ß
type´´® ¨
)´´¨ ≠
;´´≠ Æ
}
¨¨ 	
public
≥≥ 
static
≥≥ %
HelpPageSampleGenerator
≥≥ -(
GetHelpPageSampleGenerator
≥≥. H
(
≥≥H I
this
≥≥I M
HttpConfiguration
≥≥N _
config
≥≥` f
)
≥≥f g
{
¥¥ 	
return
µµ 
(
µµ %
HelpPageSampleGenerator
µµ +
)
µµ+ ,
config
µµ, 2
.
µµ2 3

Properties
µµ3 =
.
µµ= >
GetOrAdd
µµ> F
(
µµF G
typeof
∂∂ 
(
∂∂ %
HelpPageSampleGenerator
∂∂ .
)
∂∂. /
,
∂∂/ 0
k
∑∑ 
=>
∑∑ 
new
∑∑ %
HelpPageSampleGenerator
∑∑ 0
(
∑∑0 1
)
∑∑1 2
)
∑∑2 3
;
∑∑3 4
}
∏∏ 	
public
øø 
static
øø 
void
øø (
SetHelpPageSampleGenerator
øø 5
(
øø5 6
this
øø6 :
HttpConfiguration
øø; L
config
øøM S
,
øøS T%
HelpPageSampleGenerator
øøU l
sampleGenerator
øøm |
)
øø| }
{
¿¿ 	
config
¡¡ 
.
¡¡ 

Properties
¡¡ 
.
¡¡ 
AddOrUpdate
¡¡ )
(
¡¡) *
typeof
¬¬ 
(
¬¬ %
HelpPageSampleGenerator
¬¬ .
)
¬¬. /
,
¬¬/ 0
k
√√ 
=>
√√ 
sampleGenerator
√√ $
,
√√$ %
(
ƒƒ 
k
ƒƒ 
,
ƒƒ 
o
ƒƒ 
)
ƒƒ 
=>
ƒƒ 
sampleGenerator
ƒƒ )
)
ƒƒ) *
;
ƒƒ* +
}
≈≈ 	
public
ÃÃ 
static
ÃÃ '
ModelDescriptionGenerator
ÃÃ /*
GetModelDescriptionGenerator
ÃÃ0 L
(
ÃÃL M
this
ÃÃM Q
HttpConfiguration
ÃÃR c
config
ÃÃd j
)
ÃÃj k
{
ÕÕ 	
return
ŒŒ 
(
ŒŒ '
ModelDescriptionGenerator
ŒŒ -
)
ŒŒ- .
config
ŒŒ. 4
.
ŒŒ4 5

Properties
ŒŒ5 ?
.
ŒŒ? @
GetOrAdd
ŒŒ@ H
(
ŒŒH I
typeof
œœ 
(
œœ '
ModelDescriptionGenerator
œœ 0
)
œœ0 1
,
œœ1 2
k
–– 
=>
–– 1
#InitializeModelDescriptionGenerator
–– 8
(
––8 9
config
––9 ?
)
––? @
)
––@ A
;
––A B
}
—— 	
public
€€ 
static
€€ 
HelpPageApiModel
€€ &!
GetHelpPageApiModel
€€' :
(
€€: ;
this
€€; ?
HttpConfiguration
€€@ Q
config
€€R X
,
€€X Y
string
€€Z `
apiDescriptionId
€€a q
)
€€q r
{
‹‹ 	
object
›› 
model
›› 
;
›› 
string
ﬁﬁ 
modelId
ﬁﬁ 
=
ﬁﬁ 
ApiModelPrefix
ﬁﬁ +
+
ﬁﬁ, -
apiDescriptionId
ﬁﬁ. >
;
ﬁﬁ> ?
if
ﬂﬂ 
(
ﬂﬂ 
!
ﬂﬂ 
config
ﬂﬂ 
.
ﬂﬂ 

Properties
ﬂﬂ "
.
ﬂﬂ" #
TryGetValue
ﬂﬂ# .
(
ﬂﬂ. /
modelId
ﬂﬂ/ 6
,
ﬂﬂ6 7
out
ﬂﬂ8 ;
model
ﬂﬂ< A
)
ﬂﬂA B
)
ﬂﬂB C
{
‡‡ 

Collection
·· 
<
·· 
ApiDescription
·· )
>
··) *
apiDescriptions
··+ :
=
··; <
config
··= C
.
··C D
Services
··D L
.
··L M
GetApiExplorer
··M [
(
··[ \
)
··\ ]
.
··] ^
ApiDescriptions
··^ m
;
··m n
ApiDescription
‚‚ 
apiDescription
‚‚ -
=
‚‚. /
apiDescriptions
‚‚0 ?
.
‚‚? @
FirstOrDefault
‚‚@ N
(
‚‚N O
api
‚‚O R
=>
‚‚S U
String
‚‚V \
.
‚‚\ ]
Equals
‚‚] c
(
‚‚c d
api
‚‚d g
.
‚‚g h
GetFriendlyId
‚‚h u
(
‚‚u v
)
‚‚v w
,
‚‚w x
apiDescriptionId‚‚y â
,‚‚â ä 
StringComparison‚‚ã õ
.‚‚õ ú!
OrdinalIgnoreCase‚‚ú ≠
)‚‚≠ Æ
)‚‚Æ Ø
;‚‚Ø ∞
if
„„ 
(
„„ 
apiDescription
„„ "
!=
„„# %
null
„„& *
)
„„* +
{
‰‰ 
model
ÂÂ 
=
ÂÂ 
GenerateApiModel
ÂÂ ,
(
ÂÂ, -
apiDescription
ÂÂ- ;
,
ÂÂ; <
config
ÂÂ= C
)
ÂÂC D
;
ÂÂD E
config
ÊÊ 
.
ÊÊ 

Properties
ÊÊ %
.
ÊÊ% &
TryAdd
ÊÊ& ,
(
ÊÊ, -
modelId
ÊÊ- 4
,
ÊÊ4 5
model
ÊÊ6 ;
)
ÊÊ; <
;
ÊÊ< =
}
ÁÁ 
}
ËË 
return
ÍÍ 
(
ÍÍ 
HelpPageApiModel
ÍÍ $
)
ÍÍ$ %
model
ÍÍ% *
;
ÍÍ* +
}
ÎÎ 	
private
ÌÌ 
static
ÌÌ 
HelpPageApiModel
ÌÌ '
GenerateApiModel
ÌÌ( 8
(
ÌÌ8 9
ApiDescription
ÌÌ9 G
apiDescription
ÌÌH V
,
ÌÌV W
HttpConfiguration
ÌÌX i
config
ÌÌj p
)
ÌÌp q
{
ÓÓ 	
HelpPageApiModel
ÔÔ 
apiModel
ÔÔ %
=
ÔÔ& '
new
ÔÔ( +
HelpPageApiModel
ÔÔ, <
(
ÔÔ< =
)
ÔÔ= >
{
 
ApiDescription
ÒÒ 
=
ÒÒ  
apiDescription
ÒÒ! /
,
ÒÒ/ 0
}
ÚÚ 
;
ÚÚ '
ModelDescriptionGenerator
ÙÙ %
modelGenerator
ÙÙ& 4
=
ÙÙ5 6
config
ÙÙ7 =
.
ÙÙ= >*
GetModelDescriptionGenerator
ÙÙ> Z
(
ÙÙZ [
)
ÙÙ[ \
;
ÙÙ\ ]%
HelpPageSampleGenerator
ıı #
sampleGenerator
ıı$ 3
=
ıı4 5
config
ıı6 <
.
ıı< =(
GetHelpPageSampleGenerator
ıı= W
(
ııW X
)
ııX Y
;
ııY Z#
GenerateUriParameters
ˆˆ !
(
ˆˆ! "
apiModel
ˆˆ" *
,
ˆˆ* +
modelGenerator
ˆˆ, :
)
ˆˆ: ;
;
ˆˆ; <-
GenerateRequestModelDescription
˜˜ +
(
˜˜+ ,
apiModel
˜˜, 4
,
˜˜4 5
modelGenerator
˜˜6 D
,
˜˜D E
sampleGenerator
˜˜F U
)
˜˜U V
;
˜˜V W)
GenerateResourceDescription
¯¯ '
(
¯¯' (
apiModel
¯¯( 0
,
¯¯0 1
modelGenerator
¯¯2 @
)
¯¯@ A
;
¯¯A B
GenerateSamples
˘˘ 
(
˘˘ 
apiModel
˘˘ $
,
˘˘$ %
sampleGenerator
˘˘& 5
)
˘˘5 6
;
˘˘6 7
return
˚˚ 
apiModel
˚˚ 
;
˚˚ 
}
¸¸ 	
private
˛˛ 
static
˛˛ 
void
˛˛ #
GenerateUriParameters
˛˛ 1
(
˛˛1 2
HelpPageApiModel
˛˛2 B
apiModel
˛˛C K
,
˛˛K L'
ModelDescriptionGenerator
˛˛M f
modelGenerator
˛˛g u
)
˛˛u v
{
ˇˇ 	
ApiDescription
ÄÄ 
apiDescription
ÄÄ )
=
ÄÄ* +
apiModel
ÄÄ, 4
.
ÄÄ4 5
ApiDescription
ÄÄ5 C
;
ÄÄC D
foreach
ÅÅ 
(
ÅÅ %
ApiParameterDescription
ÅÅ ,
apiParameter
ÅÅ- 9
in
ÅÅ: <
apiDescription
ÅÅ= K
.
ÅÅK L#
ParameterDescriptions
ÅÅL a
)
ÅÅa b
{
ÇÇ 
if
ÉÉ 
(
ÉÉ 
apiParameter
ÉÉ  
.
ÉÉ  !
Source
ÉÉ! '
==
ÉÉ( * 
ApiParameterSource
ÉÉ+ =
.
ÉÉ= >
FromUri
ÉÉ> E
)
ÉÉE F
{
ÑÑ %
HttpParameterDescriptor
ÖÖ +!
parameterDescriptor
ÖÖ, ?
=
ÖÖ@ A
apiParameter
ÖÖB N
.
ÖÖN O!
ParameterDescriptor
ÖÖO b
;
ÖÖb c
Type
ÜÜ 
parameterType
ÜÜ &
=
ÜÜ' (
null
ÜÜ) -
;
ÜÜ- .
ModelDescription
áá $
typeDescription
áá% 4
=
áá5 6
null
áá7 ;
;
áá; <)
ComplexTypeModelDescription
àà /$
complexTypeDescription
àà0 F
=
ààG H
null
ààI M
;
ààM N
if
ââ 
(
ââ !
parameterDescriptor
ââ +
!=
ââ, .
null
ââ/ 3
)
ââ3 4
{
ää 
parameterType
ãã %
=
ãã& '!
parameterDescriptor
ãã( ;
.
ãã; <
ParameterType
ãã< I
;
ããI J
typeDescription
åå '
=
åå( )
modelGenerator
åå* 8
.
åå8 9)
GetOrCreateModelDescription
åå9 T
(
ååT U
parameterType
ååU b
)
ååb c
;
ååc d$
complexTypeDescription
çç .
=
çç/ 0
typeDescription
çç1 @
as
ççA C)
ComplexTypeModelDescription
ççD _
;
çç_ `
}
éé 
if
§§ 
(
§§ $
complexTypeDescription
§§ .
!=
§§/ 1
null
§§2 6
&&
•• 
!
•• )
IsBindableWithTypeConverter
•• 7
(
••7 8
parameterType
••8 E
)
••E F
)
••F G
{
¶¶ 
foreach
ßß 
(
ßß  !"
ParameterDescription
ßß! 5
uriParameter
ßß6 B
in
ßßC E$
complexTypeDescription
ßßF \
.
ßß\ ]

Properties
ßß] g
)
ßßg h
{
®® 
apiModel
©© $
.
©©$ %
UriParameters
©©% 2
.
©©2 3
Add
©©3 6
(
©©6 7
uriParameter
©©7 C
)
©©C D
;
©©D E
}
™™ 
}
´´ 
else
¨¨ 
if
¨¨ 
(
¨¨ !
parameterDescriptor
¨¨ 0
!=
¨¨1 3
null
¨¨4 8
)
¨¨8 9
{
≠≠ "
ParameterDescription
ÆÆ ,
uriParameter
ÆÆ- 9
=
ÆÆ: ;%
AddParameterDescription
ØØ 3
(
ØØ3 4
apiModel
ØØ4 <
,
ØØ< =
apiParameter
ØØ> J
,
ØØJ K
typeDescription
ØØL [
)
ØØ[ \
;
ØØ\ ]
if
±± 
(
±± 
!
±± !
parameterDescriptor
±± 0
.
±±0 1

IsOptional
±±1 ;
)
±±; <
{
≤≤ 
uriParameter
≥≥ (
.
≥≥( )
Annotations
≥≥) 4
.
≥≥4 5
Add
≥≥5 8
(
≥≥8 9
new
≥≥9 <!
ParameterAnnotation
≥≥= P
(
≥≥P Q
)
≥≥Q R
{
≥≥S T
Documentation
≥≥U b
=
≥≥c d
$str
≥≥e o
}
≥≥p q
)
≥≥q r
;
≥≥r s
}
¥¥ 
object
∂∂ 
defaultValue
∂∂ +
=
∂∂, -!
parameterDescriptor
∂∂. A
.
∂∂A B
DefaultValue
∂∂B N
;
∂∂N O
if
∑∑ 
(
∑∑ 
defaultValue
∑∑ (
!=
∑∑) +
null
∑∑, 0
)
∑∑0 1
{
∏∏ 
uriParameter
ππ (
.
ππ( )
Annotations
ππ) 4
.
ππ4 5
Add
ππ5 8
(
ππ8 9
new
ππ9 <!
ParameterAnnotation
ππ= P
(
ππP Q
)
ππQ R
{
ππS T
Documentation
ππU b
=
ππc d
$str
ππe x
+
ππy z
Convertππ{ Ç
.ππÇ É
ToStringππÉ ã
(ππã å
defaultValueππå ò
,ππò ô
CultureInfoππö •
.ππ• ¶ 
InvariantCultureππ¶ ∂
)ππ∂ ∑
}ππ∏ π
)πππ ∫
;ππ∫ ª
}
∫∫ 
}
ªª 
else
ºº 
{
ΩΩ 
Debug
ææ 
.
ææ 
Assert
ææ $
(
ææ$ %!
parameterDescriptor
ææ% 8
==
ææ9 ;
null
ææ< @
)
ææ@ A
;
ææA B
ModelDescription
√√ (
modelDescription
√√) 9
=
√√: ;
modelGenerator
√√< J
.
√√J K)
GetOrCreateModelDescription
√√K f
(
√√f g
typeof
√√g m
(
√√m n
string
√√n t
)
√√t u
)
√√u v
;
√√v w%
AddParameterDescription
ƒƒ /
(
ƒƒ/ 0
apiModel
ƒƒ0 8
,
ƒƒ8 9
apiParameter
ƒƒ: F
,
ƒƒF G
modelDescription
ƒƒH X
)
ƒƒX Y
;
ƒƒY Z
}
≈≈ 
}
∆∆ 
}
«« 
}
»» 	
private
   
static
   
bool
   )
IsBindableWithTypeConverter
   7
(
  7 8
Type
  8 <
parameterType
  = J
)
  J K
{
ÀÀ 	
if
ÃÃ 
(
ÃÃ 
parameterType
ÃÃ 
==
ÃÃ  
null
ÃÃ! %
)
ÃÃ% &
{
ÕÕ 
return
ŒŒ 
false
ŒŒ 
;
ŒŒ 
}
œœ 
return
—— 
TypeDescriptor
—— !
.
——! "
GetConverter
——" .
(
——. /
parameterType
——/ <
)
——< =
.
——= >
CanConvertFrom
——> L
(
——L M
typeof
——M S
(
——S T
string
——T Z
)
——Z [
)
——[ \
;
——\ ]
}
““ 	
private
‘‘ 
static
‘‘ "
ParameterDescription
‘‘ +%
AddParameterDescription
‘‘, C
(
‘‘C D
HelpPageApiModel
‘‘D T
apiModel
‘‘U ]
,
‘‘] ^%
ApiParameterDescription
’’ #
apiParameter
’’$ 0
,
’’0 1
ModelDescription
’’2 B
typeDescription
’’C R
)
’’R S
{
÷÷ 	"
ParameterDescription
◊◊  "
parameterDescription
◊◊! 5
=
◊◊6 7
new
◊◊8 ;"
ParameterDescription
◊◊< P
{
ÿÿ 
Name
ŸŸ 
=
ŸŸ 
apiParameter
ŸŸ #
.
ŸŸ# $
Name
ŸŸ$ (
,
ŸŸ( )
Documentation
⁄⁄ 
=
⁄⁄ 
apiParameter
⁄⁄  ,
.
⁄⁄, -
Documentation
⁄⁄- :
,
⁄⁄: ;
TypeDescription
€€ 
=
€€  !
typeDescription
€€" 1
,
€€1 2
}
‹‹ 
;
‹‹ 
apiModel
ﬁﬁ 
.
ﬁﬁ 
UriParameters
ﬁﬁ "
.
ﬁﬁ" #
Add
ﬁﬁ# &
(
ﬁﬁ& '"
parameterDescription
ﬁﬁ' ;
)
ﬁﬁ; <
;
ﬁﬁ< =
return
ﬂﬂ "
parameterDescription
ﬂﬂ '
;
ﬂﬂ' (
}
‡‡ 	
private
‚‚ 
static
‚‚ 
void
‚‚ -
GenerateRequestModelDescription
‚‚ ;
(
‚‚; <
HelpPageApiModel
‚‚< L
apiModel
‚‚M U
,
‚‚U V'
ModelDescriptionGenerator
‚‚W p
modelGenerator
‚‚q 
,‚‚ Ä'
HelpPageSampleGenerator‚‚Å ò
sampleGenerator‚‚ô ®
)‚‚® ©
{
„„ 	
ApiDescription
‰‰ 
apiDescription
‰‰ )
=
‰‰* +
apiModel
‰‰, 4
.
‰‰4 5
ApiDescription
‰‰5 C
;
‰‰C D
foreach
ÂÂ 
(
ÂÂ %
ApiParameterDescription
ÂÂ ,
apiParameter
ÂÂ- 9
in
ÂÂ: <
apiDescription
ÂÂ= K
.
ÂÂK L#
ParameterDescriptions
ÂÂL a
)
ÂÂa b
{
ÊÊ 
if
ÁÁ 
(
ÁÁ 
apiParameter
ÁÁ  
.
ÁÁ  !
Source
ÁÁ! '
==
ÁÁ( * 
ApiParameterSource
ÁÁ+ =
.
ÁÁ= >
FromBody
ÁÁ> F
)
ÁÁF G
{
ËË 
Type
ÈÈ 
parameterType
ÈÈ &
=
ÈÈ' (
apiParameter
ÈÈ) 5
.
ÈÈ5 6!
ParameterDescriptor
ÈÈ6 I
.
ÈÈI J
ParameterType
ÈÈJ W
;
ÈÈW X
apiModel
ÍÍ 
.
ÍÍ %
RequestModelDescription
ÍÍ 4
=
ÍÍ5 6
modelGenerator
ÍÍ7 E
.
ÍÍE F)
GetOrCreateModelDescription
ÍÍF a
(
ÍÍa b
parameterType
ÍÍb o
)
ÍÍo p
;
ÍÍp q
apiModel
ÎÎ 
.
ÎÎ "
RequestDocumentation
ÎÎ 1
=
ÎÎ2 3
apiParameter
ÎÎ4 @
.
ÎÎ@ A
Documentation
ÎÎA N
;
ÎÎN O
}
ÏÏ 
else
ÌÌ 
if
ÌÌ 
(
ÌÌ 
apiParameter
ÌÌ %
.
ÌÌ% &!
ParameterDescriptor
ÌÌ& 9
!=
ÌÌ: <
null
ÌÌ= A
&&
ÌÌB D
apiParameter
ÓÓ  
.
ÓÓ  !!
ParameterDescriptor
ÓÓ! 4
.
ÓÓ4 5
ParameterType
ÓÓ5 B
==
ÓÓC E
typeof
ÓÓF L
(
ÓÓL M 
HttpRequestMessage
ÓÓM _
)
ÓÓ_ `
)
ÓÓ` a
{
ÔÔ 
Type
 
parameterType
 &
=
' (
sampleGenerator
) 8
.
8 9+
ResolveHttpRequestMessageType
9 V
(
V W
apiDescription
W e
)
e f
;
f g
if
ÚÚ 
(
ÚÚ 
parameterType
ÚÚ %
!=
ÚÚ& (
null
ÚÚ) -
)
ÚÚ- .
{
ÛÛ 
apiModel
ÙÙ  
.
ÙÙ  !%
RequestModelDescription
ÙÙ! 8
=
ÙÙ9 :
modelGenerator
ÙÙ; I
.
ÙÙI J)
GetOrCreateModelDescription
ÙÙJ e
(
ÙÙe f
parameterType
ÙÙf s
)
ÙÙs t
;
ÙÙt u
}
ıı 
}
ˆˆ 
}
˜˜ 
}
¯¯ 	
private
˙˙ 
static
˙˙ 
void
˙˙ )
GenerateResourceDescription
˙˙ 7
(
˙˙7 8
HelpPageApiModel
˙˙8 H
apiModel
˙˙I Q
,
˙˙Q R'
ModelDescriptionGenerator
˙˙S l
modelGenerator
˙˙m {
)
˙˙{ |
{
˚˚ 	!
ResponseDescription
¸¸ 
response
¸¸  (
=
¸¸) *
apiModel
¸¸+ 3
.
¸¸3 4
ApiDescription
¸¸4 B
.
¸¸B C!
ResponseDescription
¸¸C V
;
¸¸V W
Type
˝˝ 
responseType
˝˝ 
=
˝˝ 
response
˝˝  (
.
˝˝( )
ResponseType
˝˝) 5
??
˝˝6 8
response
˝˝9 A
.
˝˝A B
DeclaredType
˝˝B N
;
˝˝N O
if
˛˛ 
(
˛˛ 
responseType
˛˛ 
!=
˛˛ 
null
˛˛  $
&&
˛˛% '
responseType
˛˛( 4
!=
˛˛5 7
typeof
˛˛8 >
(
˛˛> ?
void
˛˛? C
)
˛˛C D
)
˛˛D E
{
ˇˇ 
apiModel
ÄÄ 
.
ÄÄ !
ResourceDescription
ÄÄ ,
=
ÄÄ- .
modelGenerator
ÄÄ/ =
.
ÄÄ= >)
GetOrCreateModelDescription
ÄÄ> Y
(
ÄÄY Z
responseType
ÄÄZ f
)
ÄÄf g
;
ÄÄg h
}
ÅÅ 
}
ÇÇ 	
[
ÑÑ 	
SuppressMessage
ÑÑ	 
(
ÑÑ 
$str
ÑÑ +
,
ÑÑ+ ,
$str
ÑÑ- U
,
ÑÑU V
Justification
ÑÑW d
=
ÑÑe f
$strÑÑg î
)ÑÑî ï
]ÑÑï ñ
private
ÖÖ 
static
ÖÖ 
void
ÖÖ 
GenerateSamples
ÖÖ +
(
ÖÖ+ ,
HelpPageApiModel
ÖÖ, <
apiModel
ÖÖ= E
,
ÖÖE F%
HelpPageSampleGenerator
ÖÖG ^
sampleGenerator
ÖÖ_ n
)
ÖÖn o
{
ÜÜ 	
try
áá 
{
àà 
foreach
ââ 
(
ââ 
var
ââ 
item
ââ !
in
ââ" $
sampleGenerator
ââ% 4
.
ââ4 5
GetSampleRequests
ââ5 F
(
ââF G
apiModel
ââG O
.
ââO P
ApiDescription
ââP ^
)
ââ^ _
)
ââ_ `
{
ää 
apiModel
ãã 
.
ãã 
SampleRequests
ãã +
.
ãã+ ,
Add
ãã, /
(
ãã/ 0
item
ãã0 4
.
ãã4 5
Key
ãã5 8
,
ãã8 9
item
ãã: >
.
ãã> ?
Value
ãã? D
)
ããD E
;
ããE F%
LogInvalidSampleAsError
åå +
(
åå+ ,
apiModel
åå, 4
,
åå4 5
item
åå6 :
.
åå: ;
Value
åå; @
)
åå@ A
;
ååA B
}
çç 
foreach
èè 
(
èè 
var
èè 
item
èè !
in
èè" $
sampleGenerator
èè% 4
.
èè4 5 
GetSampleResponses
èè5 G
(
èèG H
apiModel
èèH P
.
èèP Q
ApiDescription
èèQ _
)
èè_ `
)
èè` a
{
êê 
apiModel
ëë 
.
ëë 
SampleResponses
ëë ,
.
ëë, -
Add
ëë- 0
(
ëë0 1
item
ëë1 5
.
ëë5 6
Key
ëë6 9
,
ëë9 :
item
ëë; ?
.
ëë? @
Value
ëë@ E
)
ëëE F
;
ëëF G%
LogInvalidSampleAsError
íí +
(
íí+ ,
apiModel
íí, 4
,
íí4 5
item
íí6 :
.
íí: ;
Value
íí; @
)
íí@ A
;
ííA B
}
ìì 
}
îî 
catch
ïï 
(
ïï 
	Exception
ïï 
e
ïï 
)
ïï 
{
ññ 
apiModel
óó 
.
óó 
ErrorMessages
óó &
.
óó& '
Add
óó' *
(
óó* +
String
óó+ 1
.
óó1 2
Format
óó2 8
(
óó8 9
CultureInfo
óó9 D
.
óóD E
CurrentCulture
óóE S
,
óóS T
$str
òò c
,
òòc d%
HelpPageSampleGenerator
ôô +
.
ôô+ ,
UnwrapException
ôô, ;
(
ôô; <
e
ôô< =
)
ôô= >
.
ôô> ?
Message
ôô? F
)
ôôF G
)
ôôG H
;
ôôH I
}
öö 
}
õõ 	
private
ùù 
static
ùù 
bool
ùù %
TryGetResourceParameter
ùù 3
(
ùù3 4
ApiDescription
ùù4 B
apiDescription
ùùC Q
,
ùùQ R
HttpConfiguration
ùùS d
config
ùùe k
,
ùùk l
out
ùùm p&
ApiParameterDescriptionùùq à$
parameterDescriptionùùâ ù
,ùùù û
outùùü ¢
Typeùù£ ß
resourceTypeùù® ¥
)ùù¥ µ
{
ûû 	"
parameterDescription
üü  
=
üü! "
apiDescription
üü# 1
.
üü1 2#
ParameterDescriptions
üü2 G
.
üüG H
FirstOrDefault
üüH V
(
üüV W
p
†† 
=>
†† 
p
†† 
.
†† 
Source
†† 
==
††   
ApiParameterSource
††! 3
.
††3 4
FromBody
††4 <
||
††= ?
(
°° 
p
°° 
.
°° !
ParameterDescriptor
°° *
!=
°°+ -
null
°°. 2
&&
°°3 5
p
°°6 7
.
°°7 8!
ParameterDescriptor
°°8 K
.
°°K L
ParameterType
°°L Y
==
°°Z \
typeof
°°] c
(
°°c d 
HttpRequestMessage
°°d v
)
°°v w
)
°°w x
)
°°x y
;
°°y z
if
££ 
(
££ "
parameterDescription
££ $
==
££% '
null
££( ,
)
££, -
{
§§ 
resourceType
•• 
=
•• 
null
•• #
;
••# $
return
¶¶ 
false
¶¶ 
;
¶¶ 
}
ßß 
resourceType
©© 
=
©© "
parameterDescription
©© /
.
©©/ 0!
ParameterDescriptor
©©0 C
.
©©C D
ParameterType
©©D Q
;
©©Q R
if
´´ 
(
´´ 
resourceType
´´ 
==
´´ 
typeof
´´  &
(
´´& ' 
HttpRequestMessage
´´' 9
)
´´9 :
)
´´: ;
{
¨¨ %
HelpPageSampleGenerator
≠≠ '
sampleGenerator
≠≠( 7
=
≠≠8 9
config
≠≠: @
.
≠≠@ A(
GetHelpPageSampleGenerator
≠≠A [
(
≠≠[ \
)
≠≠\ ]
;
≠≠] ^
resourceType
ÆÆ 
=
ÆÆ 
sampleGenerator
ÆÆ .
.
ÆÆ. /+
ResolveHttpRequestMessageType
ÆÆ/ L
(
ÆÆL M
apiDescription
ÆÆM [
)
ÆÆ[ \
;
ÆÆ\ ]
}
ØØ 
if
±± 
(
±± 
resourceType
±± 
==
±± 
null
±±  $
)
±±$ %
{
≤≤ "
parameterDescription
≥≥ $
=
≥≥% &
null
≥≥' +
;
≥≥+ ,
return
¥¥ 
false
¥¥ 
;
¥¥ 
}
µµ 
return
∑∑ 
true
∑∑ 
;
∑∑ 
}
∏∏ 	
private
∫∫ 
static
∫∫ '
ModelDescriptionGenerator
∫∫ 01
#InitializeModelDescriptionGenerator
∫∫1 T
(
∫∫T U
HttpConfiguration
∫∫U f
config
∫∫g m
)
∫∫m n
{
ªª 	'
ModelDescriptionGenerator
ºº %
modelGenerator
ºº& 4
=
ºº5 6
new
ºº7 :'
ModelDescriptionGenerator
ºº; T
(
ººT U
config
ººU [
)
ºº[ \
;
ºº\ ]

Collection
ΩΩ 
<
ΩΩ 
ApiDescription
ΩΩ %
>
ΩΩ% &
apis
ΩΩ' +
=
ΩΩ, -
config
ΩΩ. 4
.
ΩΩ4 5
Services
ΩΩ5 =
.
ΩΩ= >
GetApiExplorer
ΩΩ> L
(
ΩΩL M
)
ΩΩM N
.
ΩΩN O
ApiDescriptions
ΩΩO ^
;
ΩΩ^ _
foreach
ææ 
(
ææ 
ApiDescription
ææ #
api
ææ$ '
in
ææ( *
apis
ææ+ /
)
ææ/ 0
{
øø %
ApiParameterDescription
¿¿ '"
parameterDescription
¿¿( <
;
¿¿< =
Type
¡¡ 
parameterType
¡¡ "
;
¡¡" #
if
¬¬ 
(
¬¬ %
TryGetResourceParameter
¬¬ +
(
¬¬+ ,
api
¬¬, /
,
¬¬/ 0
config
¬¬1 7
,
¬¬7 8
out
¬¬9 <"
parameterDescription
¬¬= Q
,
¬¬Q R
out
¬¬S V
parameterType
¬¬W d
)
¬¬d e
)
¬¬e f
{
√√ 
modelGenerator
ƒƒ "
.
ƒƒ" #)
GetOrCreateModelDescription
ƒƒ# >
(
ƒƒ> ?
parameterType
ƒƒ? L
)
ƒƒL M
;
ƒƒM N
}
≈≈ 
}
∆∆ 
return
«« 
modelGenerator
«« !
;
««! "
}
»» 	
private
   
static
   
void
   %
LogInvalidSampleAsError
   3
(
  3 4
HelpPageApiModel
  4 D
apiModel
  E M
,
  M N
object
  O U
sample
  V \
)
  \ ]
{
ÀÀ 	
InvalidSample
ÃÃ 
invalidSample
ÃÃ '
=
ÃÃ( )
sample
ÃÃ* 0
as
ÃÃ1 3
InvalidSample
ÃÃ4 A
;
ÃÃA B
if
ÕÕ 
(
ÕÕ 
invalidSample
ÕÕ 
!=
ÕÕ  
null
ÕÕ! %
)
ÕÕ% &
{
ŒŒ 
apiModel
œœ 
.
œœ 
ErrorMessages
œœ &
.
œœ& '
Add
œœ' *
(
œœ* +
invalidSample
œœ+ 8
.
œœ8 9
ErrorMessage
œœ9 E
)
œœE F
;
œœF G
}
–– 
}
—— 	
}
““ 
}”” π
ØC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\ModelDescriptions\CollectionModelDescription.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
.$ %
ModelDescriptions% 6
{ 
public 

class &
CollectionModelDescription +
:, -
ModelDescription. >
{ 
public 
ModelDescription 
ElementDescription  2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
} ∏
∞C:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\ModelDescriptions\ComplexTypeModelDescription.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
.$ %
ModelDescriptions% 6
{ 
public 

class '
ComplexTypeModelDescription ,
:- .
ModelDescription/ ?
{ 
public '
ComplexTypeModelDescription *
(* +
)+ ,
{ 	

Properties		 
=		 
new		 

Collection		 '
<		' ( 
ParameterDescription		( <
>		< =
(		= >
)		> ?
;		? @
}

 	
public 

Collection 
<  
ParameterDescription .
>. /

Properties0 :
{; <
get= @
;@ A
privateB I
setJ M
;M N
}O P
} 
} ï
ØC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\ModelDescriptions\DictionaryModelDescription.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
.$ %
ModelDescriptions% 6
{ 
public 

class &
DictionaryModelDescription +
:, -(
KeyValuePairModelDescription. J
{ 
} 
} ß
≠C:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\ModelDescriptions\EnumTypeModelDescription.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
.$ %
ModelDescriptions% 6
{ 
public 

class $
EnumTypeModelDescription )
:* +
ModelDescription, <
{ 
public $
EnumTypeModelDescription '
(' (
)( )
{		 	
Values

 
=

 
new

 

Collection

 #
<

# $ 
EnumValueDescription

$ 8
>

8 9
(

9 :
)

: ;
;

; <
} 	
public 

Collection 
<  
EnumValueDescription .
>. /
Values0 6
{7 8
get9 <
;< =
private> E
setF I
;I J
}K L
} 
} ¢
©C:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\ModelDescriptions\EnumValueDescription.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
.$ %
ModelDescriptions% 6
{ 
public 

class  
EnumValueDescription %
{ 
public 
string 
Documentation #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
Value		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
}

 
} 
∞C:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\ModelDescriptions\IModelDocumentationProvider.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
.$ %
ModelDescriptions% 6
{ 
public 

	interface '
IModelDocumentationProvider 0
{ 
string 
GetDocumentation 
(  

MemberInfo  *
member+ 1
)1 2
;2 3
string

 
GetDocumentation

 
(

  
Type

  $
type

% )
)

) *
;

* +
} 
} Ò
±C:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\ModelDescriptions\KeyValuePairModelDescription.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
.$ %
ModelDescriptions% 6
{ 
public 

class (
KeyValuePairModelDescription -
:. /
ModelDescription0 @
{ 
public 
ModelDescription 
KeyModelDescription  3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
ModelDescription !
ValueModelDescription  5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
} 
}		 ≤
•C:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\ModelDescriptions\ModelDescription.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
.$ %
ModelDescriptions% 6
{ 
public 

abstract 
class 
ModelDescription *
{		 
public

 
string

 
Documentation

 #
{

$ %
get

& )
;

) *
set

+ .
;

. /
}

0 1
public 
Type 
	ModelType 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ƒ–
ÆC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\ModelDescriptions\ModelDescriptionGenerator.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
.$ %
ModelDescriptions% 6
{ 
public 

class %
ModelDescriptionGenerator *
{ 
private 
readonly 
IDictionary $
<$ %
Type% )
,) *
Func+ /
</ 0
object0 6
,6 7
string8 >
>> ?
>? @#
AnnotationTextGeneratorA X
=Y Z
new[ ^

Dictionary_ i
<i j
Typej n
,n o
Funcp t
<t u
objectu {
,{ |
string	} É
>
É Ñ
>
Ñ Ö
{ 	
{ 
typeof 
( 
RequiredAttribute &
)& '
,' (
a) *
=>+ -
$str. 8
}9 :
,: ;
{ 
typeof 
( 
RangeAttribute #
)# $
,$ %
a& '
=>( *
{ 
RangeAttribute "
range# (
=) *
(+ ,
RangeAttribute, :
): ;
a; <
;< =
return 
String !
.! "
Format" (
(( )
CultureInfo) 4
.4 5
CurrentCulture5 C
,C D
$strE k
,k l
rangem r
.r s
Minimums z
,z {
range	| Å
.
Å Ç
Maximum
Ç â
)
â ä
;
ä ã
} 
} 
, 
{ 
typeof 
( 
MaxLengthAttribute '
)' (
,( )
a* +
=>, .
{   
MaxLengthAttribute!! &
	maxLength!!' 0
=!!1 2
(!!3 4
MaxLengthAttribute!!4 F
)!!F G
a!!G H
;!!H I
return"" 
String"" !
.""! "
Format""" (
(""( )
CultureInfo"") 4
.""4 5
CurrentCulture""5 C
,""C D
$str""E V
,""V W
	maxLength""X a
.""a b
Length""b h
)""h i
;""i j
}## 
}$$ 
,$$ 
{%% 
typeof%% 
(%% 
MinLengthAttribute%% '
)%%' (
,%%( )
a%%* +
=>%%, .
{&& 
MinLengthAttribute'' &
	minLength''' 0
=''1 2
(''3 4
MinLengthAttribute''4 F
)''F G
a''G H
;''H I
return(( 
String(( !
.((! "
Format((" (
(((( )
CultureInfo(() 4
.((4 5
CurrentCulture((5 C
,((C D
$str((E V
,((V W
	minLength((X a
.((a b
Length((b h
)((h i
;((i j
})) 
}** 
,** 
{++ 
typeof++ 
(++ !
StringLengthAttribute++ *
)++* +
,+++ ,
a++- .
=>++/ 1
{,, !
StringLengthAttribute-- )
	strLength--* 3
=--4 5
(--6 7!
StringLengthAttribute--7 L
)--L M
a--M N
;--N O
return.. 
String.. !
...! "
Format.." (
(..( )
CultureInfo..) 4
...4 5
CurrentCulture..5 C
,..C D
$str..E s
,..s t
	strLength..u ~
...~ 
MinimumLength	.. å
,
..å ç
	strLength
..é ó
.
..ó ò
MaximumLength
..ò •
)
..• ¶
;
..¶ ß
}// 
}00 
,00 
{11 
typeof11 
(11 
DataTypeAttribute11 &
)11& '
,11' (
a11) *
=>11+ -
{22 
DataTypeAttribute33 %
dataType33& .
=33/ 0
(331 2
DataTypeAttribute332 C
)33C D
a33D E
;33E F
return44 
String44 !
.44! "
Format44" (
(44( )
CultureInfo44) 4
.444 5
CurrentCulture445 C
,44C D
$str44E U
,44U V
dataType44W _
.44_ `
CustomDataType44` n
??44o q
dataType44r z
.44z {
DataType	44{ É
.
44É Ñ
ToString
44Ñ å
(
44å ç
)
44ç é
)
44é è
;
44è ê
}55 
}66 
,66 
{77 
typeof77 
(77 &
RegularExpressionAttribute77 /
)77/ 0
,770 1
a772 3
=>774 6
{88 &
RegularExpressionAttribute99 .
regularExpression99/ @
=99A B
(99C D&
RegularExpressionAttribute99D ^
)99^ _
a99_ `
;99` a
return:: 
String:: !
.::! "
Format::" (
(::( )
CultureInfo::) 4
.::4 5
CurrentCulture::5 C
,::C D
$str::E o
,::o p
regularExpression	::q Ç
.
::Ç É
Pattern
::É ä
)
::ä ã
;
::ã å
};; 
}<< 
,<< 
}== 	
;==	 

private@@ 
readonly@@ 
IDictionary@@ $
<@@$ %
Type@@% )
,@@) *
string@@+ 1
>@@1 2$
DefaultTypeDocumentation@@3 K
=@@L M
new@@N Q

Dictionary@@R \
<@@\ ]
Type@@] a
,@@a b
string@@c i
>@@i j
{AA 	
{BB 
typeofBB 
(BB 
Int16BB 
)BB 
,BB 
$strBB &
}BB' (
,BB( )
{CC 
typeofCC 
(CC 
Int32CC 
)CC 
,CC 
$strCC &
}CC' (
,CC( )
{DD 
typeofDD 
(DD 
Int64DD 
)DD 
,DD 
$strDD &
}DD' (
,DD( )
{EE 
typeofEE 
(EE 
UInt16EE 
)EE 
,EE 
$strEE 0
}EE1 2
,EE2 3
{FF 
typeofFF 
(FF 
UInt32FF 
)FF 
,FF 
$strFF 0
}FF1 2
,FF2 3
{GG 
typeofGG 
(GG 
UInt64GG 
)GG 
,GG 
$strGG 0
}GG1 2
,GG2 3
{HH 
typeofHH 
(HH 
ByteHH 
)HH 
,HH 
$strHH "
}HH# $
,HH$ %
{II 
typeofII 
(II 
CharII 
)II 
,II 
$strII '
}II( )
,II) *
{JJ 
typeofJJ 
(JJ 
SByteJJ 
)JJ 
,JJ 
$strJJ *
}JJ+ ,
,JJ, -
{KK 
typeofKK 
(KK 
UriKK 
)KK 
,KK 
$strKK  
}KK! "
,KK" #
{LL 
typeofLL 
(LL 
SingleLL 
)LL 
,LL 
$strLL .
}LL/ 0
,LL0 1
{MM 
typeofMM 
(MM 
DoubleMM 
)MM 
,MM 
$strMM .
}MM/ 0
,MM0 1
{NN 
typeofNN 
(NN 
DecimalNN 
)NN 
,NN 
$strNN /
}NN0 1
,NN1 2
{OO 
typeofOO 
(OO 
StringOO 
)OO 
,OO 
$strOO &
}OO' (
,OO( )
{PP 
typeofPP 
(PP 
GuidPP 
)PP 
,PP 
$strPP 8
}PP9 :
,PP: ;
{QQ 
typeofQQ 
(QQ 
TimeSpanQQ 
)QQ 
,QQ 
$strQQ  /
}QQ0 1
,QQ1 2
{RR 
typeofRR 
(RR 
DateTimeRR 
)RR 
,RR 
$strRR  &
}RR' (
,RR( )
{SS 
typeofSS 
(SS 
DateTimeOffsetSS #
)SS# $
,SS$ %
$strSS& ,
}SS- .
,SS. /
{TT 
typeofTT 
(TT 
BooleanTT 
)TT 
,TT 
$strTT (
}TT) *
,TT* +
}UU 	
;UU	 

privateWW 
LazyWW 
<WW '
IModelDocumentationProviderWW 0
>WW0 1"
_documentationProviderWW2 H
;WWH I
publicYY %
ModelDescriptionGeneratorYY (
(YY( )
HttpConfigurationYY) :
configYY; A
)YYA B
{ZZ 	
if[[ 
([[ 
config[[ 
==[[ 
null[[ 
)[[ 
{\\ 
throw]] 
new]] !
ArgumentNullException]] /
(]]/ 0
$str]]0 8
)]]8 9
;]]9 :
}^^ "
_documentationProvider`` "
=``# $
new``% (
Lazy``) -
<``- .'
IModelDocumentationProvider``. I
>``I J
(``J K
(``K L
)``L M
=>``N P
config``Q W
.``W X
Services``X `
.``` a$
GetDocumentationProvider``a y
(``y z
)``z {
as``| ~(
IModelDocumentationProvider	`` ö
)
``ö õ
;
``õ ú
GeneratedModelsaa 
=aa 
newaa !

Dictionaryaa" ,
<aa, -
stringaa- 3
,aa3 4
ModelDescriptionaa5 E
>aaE F
(aaF G
StringCompareraaG U
.aaU V
OrdinalIgnoreCaseaaV g
)aag h
;aah i
}bb 	
publicdd 

Dictionarydd 
<dd 
stringdd  
,dd  !
ModelDescriptiondd" 2
>dd2 3
GeneratedModelsdd4 C
{ddD E
getddF I
;ddI J
privateddK R
setddS V
;ddV W
}ddX Y
privateff '
IModelDocumentationProviderff +!
DocumentationProviderff, A
{gg 	
gethh 
{ii 
returnjj "
_documentationProviderjj -
.jj- .
Valuejj. 3
;jj3 4
}kk 
}ll 	
publicnn 
ModelDescriptionnn '
GetOrCreateModelDescriptionnn  ;
(nn; <
Typenn< @
	modelTypennA J
)nnJ K
{oo 	
ifpp 
(pp 
	modelTypepp 
==pp 
nullpp !
)pp! "
{qq 
throwrr 
newrr !
ArgumentNullExceptionrr /
(rr/ 0
$strrr0 ;
)rr; <
;rr< =
}ss 
Typeuu 
underlyingTypeuu 
=uu  !
Nullableuu" *
.uu* +
GetUnderlyingTypeuu+ <
(uu< =
	modelTypeuu= F
)uuF G
;uuG H
ifvv 
(vv 
underlyingTypevv 
!=vv !
nullvv" &
)vv& '
{ww 
	modelTypexx 
=xx 
underlyingTypexx *
;xx* +
}yy 
ModelDescription{{ 
modelDescription{{ -
;{{- .
string|| 
	modelName|| 
=|| 
ModelNameHelper|| .
.||. /
GetModelName||/ ;
(||; <
	modelType||< E
)||E F
;||F G
if}} 
(}} 
GeneratedModels}} 
.}}  
TryGetValue}}  +
(}}+ ,
	modelName}}, 5
,}}5 6
out}}7 :
modelDescription}}; K
)}}K L
)}}L M
{~~ 
if 
( 
	modelType 
!=  
modelDescription! 1
.1 2
	ModelType2 ;
); <
{
ÄÄ 
throw
ÅÅ 
new
ÅÅ '
InvalidOperationException
ÅÅ 7
(
ÅÅ7 8
String
ÇÇ 
.
ÇÇ 
Format
ÇÇ %
(
ÇÇ% &
CultureInfo
ÉÉ '
.
ÉÉ' (
CurrentCulture
ÉÉ( 6
,
ÉÉ6 7
$strÑÑ à
+ÑÑâ ä
$strÖÖ ê
,ÖÖê ë
	modelName
ÜÜ %
,
ÜÜ% &
modelDescription
áá ,
.
áá, -
	ModelType
áá- 6
.
áá6 7
FullName
áá7 ?
,
áá? @
	modelType
àà %
.
àà% &
FullName
àà& .
)
àà. /
)
àà/ 0
;
àà0 1
}
ââ 
return
ãã 
modelDescription
ãã '
;
ãã' (
}
åå 
if
éé 
(
éé &
DefaultTypeDocumentation
éé (
.
éé( )
ContainsKey
éé) 4
(
éé4 5
	modelType
éé5 >
)
éé> ?
)
éé? @
{
èè 
return
êê 0
"GenerateSimpleTypeModelDescription
êê 9
(
êê9 :
	modelType
êê: C
)
êêC D
;
êêD E
}
ëë 
if
ìì 
(
ìì 
	modelType
ìì 
.
ìì 
IsEnum
ìì  
)
ìì  !
{
îî 
return
ïï .
 GenerateEnumTypeModelDescription
ïï 7
(
ïï7 8
	modelType
ïï8 A
)
ïïA B
;
ïïB C
}
ññ 
if
òò 
(
òò 
	modelType
òò 
.
òò 
IsGenericType
òò '
)
òò' (
{
ôô 
Type
öö 
[
öö 
]
öö 
genericArguments
öö '
=
öö( )
	modelType
öö* 3
.
öö3 4!
GetGenericArguments
öö4 G
(
ööG H
)
ööH I
;
ööI J
if
úú 
(
úú 
genericArguments
úú $
.
úú$ %
Length
úú% +
==
úú, .
$num
úú/ 0
)
úú0 1
{
ùù 
Type
ûû 
enumerableType
ûû '
=
ûû( )
typeof
ûû* 0
(
ûû0 1
IEnumerable
ûû1 <
<
ûû< =
>
ûû= >
)
ûû> ?
.
ûû? @
MakeGenericType
ûû@ O
(
ûûO P
genericArguments
ûûP `
)
ûû` a
;
ûûa b
if
üü 
(
üü 
enumerableType
üü &
.
üü& '
IsAssignableFrom
üü' 7
(
üü7 8
	modelType
üü8 A
)
üüA B
)
üüB C
{
†† 
return
°° 0
"GenerateCollectionModelDescription
°° A
(
°°A B
	modelType
°°B K
,
°°K L
genericArguments
°°M ]
[
°°] ^
$num
°°^ _
]
°°_ `
)
°°` a
;
°°a b
}
¢¢ 
}
££ 
if
§§ 
(
§§ 
genericArguments
§§ $
.
§§$ %
Length
§§% +
==
§§, .
$num
§§/ 0
)
§§0 1
{
•• 
Type
¶¶ 
dictionaryType
¶¶ '
=
¶¶( )
typeof
¶¶* 0
(
¶¶0 1
IDictionary
¶¶1 <
<
¶¶< =
,
¶¶= >
>
¶¶> ?
)
¶¶? @
.
¶¶@ A
MakeGenericType
¶¶A P
(
¶¶P Q
genericArguments
¶¶Q a
)
¶¶a b
;
¶¶b c
if
ßß 
(
ßß 
dictionaryType
ßß &
.
ßß& '
IsAssignableFrom
ßß' 7
(
ßß7 8
	modelType
ßß8 A
)
ßßA B
)
ßßB C
{
®® 
return
©© 0
"GenerateDictionaryModelDescription
©© A
(
©©A B
	modelType
©©B K
,
©©K L
genericArguments
©©M ]
[
©©] ^
$num
©©^ _
]
©©_ `
,
©©` a
genericArguments
©©b r
[
©©r s
$num
©©s t
]
©©t u
)
©©u v
;
©©v w
}
™™ 
Type
¨¨ 
keyValuePairType
¨¨ )
=
¨¨* +
typeof
¨¨, 2
(
¨¨2 3
KeyValuePair
¨¨3 ?
<
¨¨? @
,
¨¨@ A
>
¨¨A B
)
¨¨B C
.
¨¨C D
MakeGenericType
¨¨D S
(
¨¨S T
genericArguments
¨¨T d
)
¨¨d e
;
¨¨e f
if
≠≠ 
(
≠≠ 
keyValuePairType
≠≠ (
.
≠≠( )
IsAssignableFrom
≠≠) 9
(
≠≠9 :
	modelType
≠≠: C
)
≠≠C D
)
≠≠D E
{
ÆÆ 
return
ØØ 2
$GenerateKeyValuePairModelDescription
ØØ C
(
ØØC D
	modelType
ØØD M
,
ØØM N
genericArguments
ØØO _
[
ØØ_ `
$num
ØØ` a
]
ØØa b
,
ØØb c
genericArguments
ØØd t
[
ØØt u
$num
ØØu v
]
ØØv w
)
ØØw x
;
ØØx y
}
∞∞ 
}
±± 
}
≤≤ 
if
¥¥ 
(
¥¥ 
	modelType
¥¥ 
.
¥¥ 
IsArray
¥¥ !
)
¥¥! "
{
µµ 
Type
∂∂ 
elementType
∂∂  
=
∂∂! "
	modelType
∂∂# ,
.
∂∂, -
GetElementType
∂∂- ;
(
∂∂; <
)
∂∂< =
;
∂∂= >
return
∑∑ 0
"GenerateCollectionModelDescription
∑∑ 9
(
∑∑9 :
	modelType
∑∑: C
,
∑∑C D
elementType
∑∑E P
)
∑∑P Q
;
∑∑Q R
}
∏∏ 
if
∫∫ 
(
∫∫ 
	modelType
∫∫ 
==
∫∫ 
typeof
∫∫ #
(
∫∫# $!
NameValueCollection
∫∫$ 7
)
∫∫7 8
)
∫∫8 9
{
ªª 
return
ºº 0
"GenerateDictionaryModelDescription
ºº 9
(
ºº9 :
	modelType
ºº: C
,
ººC D
typeof
ººE K
(
ººK L
string
ººL R
)
ººR S
,
ººS T
typeof
ººU [
(
ºº[ \
string
ºº\ b
)
ººb c
)
ººc d
;
ººd e
}
ΩΩ 
if
øø 
(
øø 
typeof
øø 
(
øø 
IDictionary
øø "
)
øø" #
.
øø# $
IsAssignableFrom
øø$ 4
(
øø4 5
	modelType
øø5 >
)
øø> ?
)
øø? @
{
¿¿ 
return
¡¡ 0
"GenerateDictionaryModelDescription
¡¡ 9
(
¡¡9 :
	modelType
¡¡: C
,
¡¡C D
typeof
¡¡E K
(
¡¡K L
object
¡¡L R
)
¡¡R S
,
¡¡S T
typeof
¡¡U [
(
¡¡[ \
object
¡¡\ b
)
¡¡b c
)
¡¡c d
;
¡¡d e
}
¬¬ 
if
ƒƒ 
(
ƒƒ 
typeof
ƒƒ 
(
ƒƒ 
IEnumerable
ƒƒ "
)
ƒƒ" #
.
ƒƒ# $
IsAssignableFrom
ƒƒ$ 4
(
ƒƒ4 5
	modelType
ƒƒ5 >
)
ƒƒ> ?
)
ƒƒ? @
{
≈≈ 
return
∆∆ 0
"GenerateCollectionModelDescription
∆∆ 9
(
∆∆9 :
	modelType
∆∆: C
,
∆∆C D
typeof
∆∆E K
(
∆∆K L
object
∆∆L R
)
∆∆R S
)
∆∆S T
;
∆∆T U
}
«« 
return
…… 1
#GenerateComplexTypeModelDescription
…… 6
(
……6 7
	modelType
……7 @
)
……@ A
;
……A B
}
   	
private
ÕÕ 
static
ÕÕ 
string
ÕÕ 
GetMemberName
ÕÕ +
(
ÕÕ+ ,

MemberInfo
ÕÕ, 6
member
ÕÕ7 =
,
ÕÕ= >
bool
ÕÕ? C&
hasDataContractAttribute
ÕÕD \
)
ÕÕ\ ]
{
ŒŒ 	#
JsonPropertyAttribute
œœ !
jsonProperty
œœ" .
=
œœ/ 0
member
œœ1 7
.
œœ7 8 
GetCustomAttribute
œœ8 J
<
œœJ K#
JsonPropertyAttribute
œœK `
>
œœ` a
(
œœa b
)
œœb c
;
œœc d
if
–– 
(
–– 
jsonProperty
–– 
!=
–– 
null
––  $
&&
––% '
!
––( )
String
––) /
.
––/ 0
IsNullOrEmpty
––0 =
(
––= >
jsonProperty
––> J
.
––J K
PropertyName
––K W
)
––W X
)
––X Y
{
—— 
return
““ 
jsonProperty
““ #
.
““# $
PropertyName
““$ 0
;
““0 1
}
”” 
if
’’ 
(
’’ &
hasDataContractAttribute
’’ (
)
’’( )
{
÷÷ !
DataMemberAttribute
◊◊ #

dataMember
◊◊$ .
=
◊◊/ 0
member
◊◊1 7
.
◊◊7 8 
GetCustomAttribute
◊◊8 J
<
◊◊J K!
DataMemberAttribute
◊◊K ^
>
◊◊^ _
(
◊◊_ `
)
◊◊` a
;
◊◊a b
if
ÿÿ 
(
ÿÿ 

dataMember
ÿÿ 
!=
ÿÿ !
null
ÿÿ" &
&&
ÿÿ' )
!
ÿÿ* +
String
ÿÿ+ 1
.
ÿÿ1 2
IsNullOrEmpty
ÿÿ2 ?
(
ÿÿ? @

dataMember
ÿÿ@ J
.
ÿÿJ K
Name
ÿÿK O
)
ÿÿO P
)
ÿÿP Q
{
ŸŸ 
return
⁄⁄ 

dataMember
⁄⁄ %
.
⁄⁄% &
Name
⁄⁄& *
;
⁄⁄* +
}
€€ 
}
‹‹ 
return
ﬁﬁ 
member
ﬁﬁ 
.
ﬁﬁ 
Name
ﬁﬁ 
;
ﬁﬁ 
}
ﬂﬂ 	
private
·· 
static
·· 
bool
·· !
ShouldDisplayMember
·· /
(
··/ 0

MemberInfo
··0 :
member
··; A
,
··A B
bool
··C G&
hasDataContractAttribute
··H `
)
··` a
{
‚‚ 	!
JsonIgnoreAttribute
„„ 

jsonIgnore
„„  *
=
„„+ ,
member
„„- 3
.
„„3 4 
GetCustomAttribute
„„4 F
<
„„F G!
JsonIgnoreAttribute
„„G Z
>
„„Z [
(
„„[ \
)
„„\ ]
;
„„] ^ 
XmlIgnoreAttribute
‰‰ 
	xmlIgnore
‰‰ (
=
‰‰) *
member
‰‰+ 1
.
‰‰1 2 
GetCustomAttribute
‰‰2 D
<
‰‰D E 
XmlIgnoreAttribute
‰‰E W
>
‰‰W X
(
‰‰X Y
)
‰‰Y Z
;
‰‰Z ['
IgnoreDataMemberAttribute
ÂÂ %
ignoreDataMember
ÂÂ& 6
=
ÂÂ7 8
member
ÂÂ9 ?
.
ÂÂ? @ 
GetCustomAttribute
ÂÂ@ R
<
ÂÂR S'
IgnoreDataMemberAttribute
ÂÂS l
>
ÂÂl m
(
ÂÂm n
)
ÂÂn o
;
ÂÂo p$
NonSerializedAttribute
ÊÊ "
nonSerialized
ÊÊ# 0
=
ÊÊ1 2
member
ÊÊ3 9
.
ÊÊ9 : 
GetCustomAttribute
ÊÊ: L
<
ÊÊL M$
NonSerializedAttribute
ÊÊM c
>
ÊÊc d
(
ÊÊd e
)
ÊÊe f
;
ÊÊf g*
ApiExplorerSettingsAttribute
ÁÁ ( 
apiExplorerSetting
ÁÁ) ;
=
ÁÁ< =
member
ÁÁ> D
.
ÁÁD E 
GetCustomAttribute
ÁÁE W
<
ÁÁW X*
ApiExplorerSettingsAttribute
ÁÁX t
>
ÁÁt u
(
ÁÁu v
)
ÁÁv w
;
ÁÁw x
bool
ÈÈ  
hasMemberAttribute
ÈÈ #
=
ÈÈ$ %
member
ÈÈ& ,
.
ÈÈ, -
DeclaringType
ÈÈ- :
.
ÈÈ: ;
IsEnum
ÈÈ; A
?
ÈÈB C
member
ÍÍ 
.
ÍÍ  
GetCustomAttribute
ÍÍ )
<
ÍÍ) *!
EnumMemberAttribute
ÍÍ* =
>
ÍÍ= >
(
ÍÍ> ?
)
ÍÍ? @
!=
ÍÍA C
null
ÍÍD H
:
ÍÍI J
member
ÎÎ 
.
ÎÎ  
GetCustomAttribute
ÎÎ )
<
ÎÎ) *!
DataMemberAttribute
ÎÎ* =
>
ÎÎ= >
(
ÎÎ> ?
)
ÎÎ? @
!=
ÎÎA C
null
ÎÎD H
;
ÎÎH I
return
ÙÙ 

jsonIgnore
ÙÙ 
==
ÙÙ  
null
ÙÙ! %
&&
ÙÙ& (
	xmlIgnore
ıı 
==
ıı 
null
ıı !
&&
ıı" $
ignoreDataMember
ˆˆ  
==
ˆˆ! #
null
ˆˆ$ (
&&
ˆˆ) +
nonSerialized
˜˜ 
==
˜˜  
null
˜˜! %
&&
˜˜& (
(
¯¯  
apiExplorerSetting
¯¯ #
==
¯¯$ &
null
¯¯' +
||
¯¯, .
!
¯¯/ 0 
apiExplorerSetting
¯¯0 B
.
¯¯B C
	IgnoreApi
¯¯C L
)
¯¯L M
&&
¯¯N P
(
˘˘ 
!
˘˘ &
hasDataContractAttribute
˘˘ *
||
˘˘+ - 
hasMemberAttribute
˘˘. @
)
˘˘@ A
;
˘˘A B
}
˙˙ 	
private
¸¸ 
string
¸¸ (
CreateDefaultDocumentation
¸¸ 1
(
¸¸1 2
Type
¸¸2 6
type
¸¸7 ;
)
¸¸; <
{
˝˝ 	
string
˛˛ 
documentation
˛˛  
;
˛˛  !
if
ˇˇ 
(
ˇˇ &
DefaultTypeDocumentation
ˇˇ (
.
ˇˇ( )
TryGetValue
ˇˇ) 4
(
ˇˇ4 5
type
ˇˇ5 9
,
ˇˇ9 :
out
ˇˇ; >
documentation
ˇˇ? L
)
ˇˇL M
)
ˇˇM N
{
ÄÄ 
return
ÅÅ 
documentation
ÅÅ $
;
ÅÅ$ %
}
ÇÇ 
if
ÉÉ 
(
ÉÉ #
DocumentationProvider
ÉÉ %
!=
ÉÉ& (
null
ÉÉ) -
)
ÉÉ- .
{
ÑÑ 
documentation
ÖÖ 
=
ÖÖ #
DocumentationProvider
ÖÖ  5
.
ÖÖ5 6
GetDocumentation
ÖÖ6 F
(
ÖÖF G
type
ÖÖG K
)
ÖÖK L
;
ÖÖL M
}
ÜÜ 
return
àà 
documentation
àà  
;
àà  !
}
ââ 	
private
ãã 
void
ãã !
GenerateAnnotations
ãã (
(
ãã( )

MemberInfo
ãã) 3
property
ãã4 <
,
ãã< ="
ParameterDescription
ãã> R
propertyModel
ããS `
)
ãã` a
{
åå 	
List
çç 
<
çç !
ParameterAnnotation
çç $
>
çç$ %
annotations
çç& 1
=
çç2 3
new
çç4 7
List
çç8 <
<
çç< =!
ParameterAnnotation
çç= P
>
ççP Q
(
ççQ R
)
ççR S
;
ççS T
IEnumerable
èè 
<
èè 
	Attribute
èè !
>
èè! "

attributes
èè# -
=
èè. /
property
èè0 8
.
èè8 9!
GetCustomAttributes
èè9 L
(
èèL M
)
èèM N
;
èèN O
foreach
êê 
(
êê 
	Attribute
êê 
	attribute
êê (
in
êê) +

attributes
êê, 6
)
êê6 7
{
ëë 
Func
íí 
<
íí 
object
íí 
,
íí 
string
íí #
>
íí# $
textGenerator
íí% 2
;
íí2 3
if
ìì 
(
ìì %
AnnotationTextGenerator
ìì +
.
ìì+ ,
TryGetValue
ìì, 7
(
ìì7 8
	attribute
ìì8 A
.
ììA B
GetType
ììB I
(
ììI J
)
ììJ K
,
ììK L
out
ììM P
textGenerator
ììQ ^
)
ìì^ _
)
ìì_ `
{
îî 
annotations
ïï 
.
ïï  
Add
ïï  #
(
ïï# $
new
ññ !
ParameterAnnotation
ññ /
{
óó !
AnnotationAttribute
òò /
=
òò0 1
	attribute
òò2 ;
,
òò; <
Documentation
ôô )
=
ôô* +
textGenerator
ôô, 9
(
ôô9 :
	attribute
ôô: C
)
ôôC D
}
öö 
)
öö 
;
öö 
}
õõ 
}
úú 
annotations
üü 
.
üü 
Sort
üü 
(
üü 
(
üü 
x
üü 
,
üü  
y
üü! "
)
üü" #
=>
üü$ &
{
†† 
if
¢¢ 
(
¢¢ 
x
¢¢ 
.
¢¢ !
AnnotationAttribute
¢¢ )
is
¢¢* ,
RequiredAttribute
¢¢- >
)
¢¢> ?
{
££ 
return
§§ 
-
§§ 
$num
§§ 
;
§§ 
}
•• 
if
¶¶ 
(
¶¶ 
y
¶¶ 
.
¶¶ !
AnnotationAttribute
¶¶ )
is
¶¶* ,
RequiredAttribute
¶¶- >
)
¶¶> ?
{
ßß 
return
®® 
$num
®® 
;
®® 
}
©© 
return
¨¨ 
String
¨¨ 
.
¨¨ 
Compare
¨¨ %
(
¨¨% &
x
¨¨& '
.
¨¨' (
Documentation
¨¨( 5
,
¨¨5 6
y
¨¨7 8
.
¨¨8 9
Documentation
¨¨9 F
,
¨¨F G
StringComparison
¨¨H X
.
¨¨X Y
OrdinalIgnoreCase
¨¨Y j
)
¨¨j k
;
¨¨k l
}
≠≠ 
)
≠≠ 
;
≠≠ 
foreach
ØØ 
(
ØØ !
ParameterAnnotation
ØØ (

annotation
ØØ) 3
in
ØØ4 6
annotations
ØØ7 B
)
ØØB C
{
∞∞ 
propertyModel
±± 
.
±± 
Annotations
±± )
.
±±) *
Add
±±* -
(
±±- .

annotation
±±. 8
)
±±8 9
;
±±9 :
}
≤≤ 
}
≥≥ 	
private
µµ (
CollectionModelDescription
µµ *0
"GenerateCollectionModelDescription
µµ+ M
(
µµM N
Type
µµN R
	modelType
µµS \
,
µµ\ ]
Type
µµ^ b
elementType
µµc n
)
µµn o
{
∂∂ 	
ModelDescription
∑∑ (
collectionModelDescription
∑∑ 7
=
∑∑8 9)
GetOrCreateModelDescription
∑∑: U
(
∑∑U V
elementType
∑∑V a
)
∑∑a b
;
∑∑b c
if
∏∏ 
(
∏∏ (
collectionModelDescription
∏∏ *
!=
∏∏+ -
null
∏∏. 2
)
∏∏2 3
{
ππ 
return
∫∫ 
new
∫∫ (
CollectionModelDescription
∫∫ 5
{
ªª 
Name
ºº 
=
ºº 
ModelNameHelper
ºº *
.
ºº* +
GetModelName
ºº+ 7
(
ºº7 8
	modelType
ºº8 A
)
ººA B
,
ººB C
	ModelType
ΩΩ 
=
ΩΩ 
	modelType
ΩΩ  )
,
ΩΩ) * 
ElementDescription
ææ &
=
ææ' ((
collectionModelDescription
ææ) C
}
øø 
;
øø 
}
¿¿ 
return
¬¬ 
null
¬¬ 
;
¬¬ 
}
√√ 	
private
≈≈ 
ModelDescription
≈≈  1
#GenerateComplexTypeModelDescription
≈≈! D
(
≈≈D E
Type
≈≈E I
	modelType
≈≈J S
)
≈≈S T
{
∆∆ 	)
ComplexTypeModelDescription
«« '%
complexModelDescription
««( ?
=
««@ A
new
««B E)
ComplexTypeModelDescription
««F a
{
»» 
Name
…… 
=
…… 
ModelNameHelper
…… &
.
……& '
GetModelName
……' 3
(
……3 4
	modelType
……4 =
)
……= >
,
……> ?
	ModelType
   
=
   
	modelType
   %
,
  % &
Documentation
ÀÀ 
=
ÀÀ (
CreateDefaultDocumentation
ÀÀ  :
(
ÀÀ: ;
	modelType
ÀÀ; D
)
ÀÀD E
}
ÃÃ 
;
ÃÃ 
GeneratedModels
ŒŒ 
.
ŒŒ 
Add
ŒŒ 
(
ŒŒ  %
complexModelDescription
ŒŒ  7
.
ŒŒ7 8
Name
ŒŒ8 <
,
ŒŒ< =%
complexModelDescription
ŒŒ> U
)
ŒŒU V
;
ŒŒV W
bool
œœ &
hasDataContractAttribute
œœ )
=
œœ* +
	modelType
œœ, 5
.
œœ5 6 
GetCustomAttribute
œœ6 H
<
œœH I#
DataContractAttribute
œœI ^
>
œœ^ _
(
œœ_ `
)
œœ` a
!=
œœb d
null
œœe i
;
œœi j
PropertyInfo
–– 
[
–– 
]
–– 

properties
–– %
=
––& '
	modelType
––( 1
.
––1 2
GetProperties
––2 ?
(
––? @
BindingFlags
––@ L
.
––L M
Public
––M S
|
––T U
BindingFlags
––V b
.
––b c
Instance
––c k
)
––k l
;
––l m
foreach
—— 
(
—— 
PropertyInfo
—— !
property
——" *
in
——+ -

properties
——. 8
)
——8 9
{
““ 
if
”” 
(
”” !
ShouldDisplayMember
”” '
(
””' (
property
””( 0
,
””0 1&
hasDataContractAttribute
””2 J
)
””J K
)
””K L
{
‘‘ "
ParameterDescription
’’ (
propertyModel
’’) 6
=
’’7 8
new
’’9 <"
ParameterDescription
’’= Q
{
÷÷ 
Name
◊◊ 
=
◊◊ 
GetMemberName
◊◊ ,
(
◊◊, -
property
◊◊- 5
,
◊◊5 6&
hasDataContractAttribute
◊◊7 O
)
◊◊O P
}
ÿÿ 
;
ÿÿ 
if
⁄⁄ 
(
⁄⁄ #
DocumentationProvider
⁄⁄ -
!=
⁄⁄. 0
null
⁄⁄1 5
)
⁄⁄5 6
{
€€ 
propertyModel
‹‹ %
.
‹‹% &
Documentation
‹‹& 3
=
‹‹4 5#
DocumentationProvider
‹‹6 K
.
‹‹K L
GetDocumentation
‹‹L \
(
‹‹\ ]
property
‹‹] e
)
‹‹e f
;
‹‹f g
}
›› !
GenerateAnnotations
ﬂﬂ '
(
ﬂﬂ' (
property
ﬂﬂ( 0
,
ﬂﬂ0 1
propertyModel
ﬂﬂ2 ?
)
ﬂﬂ? @
;
ﬂﬂ@ A%
complexModelDescription
‡‡ +
.
‡‡+ ,

Properties
‡‡, 6
.
‡‡6 7
Add
‡‡7 :
(
‡‡: ;
propertyModel
‡‡; H
)
‡‡H I
;
‡‡I J
propertyModel
·· !
.
··! "
TypeDescription
··" 1
=
··2 3)
GetOrCreateModelDescription
··4 O
(
··O P
property
··P X
.
··X Y
PropertyType
··Y e
)
··e f
;
··f g
}
‚‚ 
}
„„ 
	FieldInfo
ÂÂ 
[
ÂÂ 
]
ÂÂ 
fields
ÂÂ 
=
ÂÂ  
	modelType
ÂÂ! *
.
ÂÂ* +
	GetFields
ÂÂ+ 4
(
ÂÂ4 5
BindingFlags
ÂÂ5 A
.
ÂÂA B
Public
ÂÂB H
|
ÂÂI J
BindingFlags
ÂÂK W
.
ÂÂW X
Instance
ÂÂX `
)
ÂÂ` a
;
ÂÂa b
foreach
ÊÊ 
(
ÊÊ 
	FieldInfo
ÊÊ 
field
ÊÊ $
in
ÊÊ% '
fields
ÊÊ( .
)
ÊÊ. /
{
ÁÁ 
if
ËË 
(
ËË !
ShouldDisplayMember
ËË '
(
ËË' (
field
ËË( -
,
ËË- .&
hasDataContractAttribute
ËË/ G
)
ËËG H
)
ËËH I
{
ÈÈ "
ParameterDescription
ÍÍ (
propertyModel
ÍÍ) 6
=
ÍÍ7 8
new
ÍÍ9 <"
ParameterDescription
ÍÍ= Q
{
ÎÎ 
Name
ÏÏ 
=
ÏÏ 
GetMemberName
ÏÏ ,
(
ÏÏ, -
field
ÏÏ- 2
,
ÏÏ2 3&
hasDataContractAttribute
ÏÏ4 L
)
ÏÏL M
}
ÌÌ 
;
ÌÌ 
if
ÔÔ 
(
ÔÔ #
DocumentationProvider
ÔÔ -
!=
ÔÔ. 0
null
ÔÔ1 5
)
ÔÔ5 6
{
 
propertyModel
ÒÒ %
.
ÒÒ% &
Documentation
ÒÒ& 3
=
ÒÒ4 5#
DocumentationProvider
ÒÒ6 K
.
ÒÒK L
GetDocumentation
ÒÒL \
(
ÒÒ\ ]
field
ÒÒ] b
)
ÒÒb c
;
ÒÒc d
}
ÚÚ %
complexModelDescription
ÙÙ +
.
ÙÙ+ ,

Properties
ÙÙ, 6
.
ÙÙ6 7
Add
ÙÙ7 :
(
ÙÙ: ;
propertyModel
ÙÙ; H
)
ÙÙH I
;
ÙÙI J
propertyModel
ıı !
.
ıı! "
TypeDescription
ıı" 1
=
ıı2 3)
GetOrCreateModelDescription
ıı4 O
(
ııO P
field
ııP U
.
ııU V
	FieldType
ııV _
)
ıı_ `
;
ıı` a
}
ˆˆ 
}
˜˜ 
return
˘˘ %
complexModelDescription
˘˘ *
;
˘˘* +
}
˙˙ 	
private
¸¸ (
DictionaryModelDescription
¸¸ *0
"GenerateDictionaryModelDescription
¸¸+ M
(
¸¸M N
Type
¸¸N R
	modelType
¸¸S \
,
¸¸\ ]
Type
¸¸^ b
keyType
¸¸c j
,
¸¸j k
Type
¸¸l p
	valueType
¸¸q z
)
¸¸z {
{
˝˝ 	
ModelDescription
˛˛ !
keyModelDescription
˛˛ 0
=
˛˛1 2)
GetOrCreateModelDescription
˛˛3 N
(
˛˛N O
keyType
˛˛O V
)
˛˛V W
;
˛˛W X
ModelDescription
ˇˇ #
valueModelDescription
ˇˇ 2
=
ˇˇ3 4)
GetOrCreateModelDescription
ˇˇ5 P
(
ˇˇP Q
	valueType
ˇˇQ Z
)
ˇˇZ [
;
ˇˇ[ \
return
ÅÅ 
new
ÅÅ (
DictionaryModelDescription
ÅÅ 1
{
ÇÇ 
Name
ÉÉ 
=
ÉÉ 
ModelNameHelper
ÉÉ &
.
ÉÉ& '
GetModelName
ÉÉ' 3
(
ÉÉ3 4
	modelType
ÉÉ4 =
)
ÉÉ= >
,
ÉÉ> ?
	ModelType
ÑÑ 
=
ÑÑ 
	modelType
ÑÑ %
,
ÑÑ% &!
KeyModelDescription
ÖÖ #
=
ÖÖ$ %!
keyModelDescription
ÖÖ& 9
,
ÖÖ9 :#
ValueModelDescription
ÜÜ %
=
ÜÜ& '#
valueModelDescription
ÜÜ( =
}
áá 
;
áá 
}
àà 	
private
ää &
EnumTypeModelDescription
ää (.
 GenerateEnumTypeModelDescription
ää) I
(
ääI J
Type
ääJ N
	modelType
ääO X
)
ääX Y
{
ãã 	&
EnumTypeModelDescription
åå $
enumDescription
åå% 4
=
åå5 6
new
åå7 :&
EnumTypeModelDescription
åå; S
{
çç 
Name
éé 
=
éé 
ModelNameHelper
éé &
.
éé& '
GetModelName
éé' 3
(
éé3 4
	modelType
éé4 =
)
éé= >
,
éé> ?
	ModelType
èè 
=
èè 
	modelType
èè %
,
èè% &
Documentation
êê 
=
êê (
CreateDefaultDocumentation
êê  :
(
êê: ;
	modelType
êê; D
)
êêD E
}
ëë 
;
ëë 
bool
íí &
hasDataContractAttribute
íí )
=
íí* +
	modelType
íí, 5
.
íí5 6 
GetCustomAttribute
íí6 H
<
ííH I#
DataContractAttribute
ííI ^
>
íí^ _
(
íí_ `
)
íí` a
!=
ííb d
null
ííe i
;
ííi j
foreach
ìì 
(
ìì 
	FieldInfo
ìì 
field
ìì $
in
ìì% '
	modelType
ìì( 1
.
ìì1 2
	GetFields
ìì2 ;
(
ìì; <
BindingFlags
ìì< H
.
ììH I
Public
ììI O
|
ììP Q
BindingFlags
ììR ^
.
ìì^ _
Static
ìì_ e
)
ììe f
)
ììf g
{
îî 
if
ïï 
(
ïï !
ShouldDisplayMember
ïï '
(
ïï' (
field
ïï( -
,
ïï- .&
hasDataContractAttribute
ïï/ G
)
ïïG H
)
ïïH I
{
ññ "
EnumValueDescription
óó (
	enumValue
óó) 2
=
óó3 4
new
óó5 8"
EnumValueDescription
óó9 M
{
òò 
Name
ôô 
=
ôô 
field
ôô $
.
ôô$ %
Name
ôô% )
,
ôô) *
Value
öö 
=
öö 
field
öö  %
.
öö% &!
GetRawConstantValue
öö& 9
(
öö9 :
)
öö: ;
.
öö; <
ToString
öö< D
(
ööD E
)
ööE F
}
õõ 
;
õõ 
if
úú 
(
úú #
DocumentationProvider
úú -
!=
úú. 0
null
úú1 5
)
úú5 6
{
ùù 
	enumValue
ûû !
.
ûû! "
Documentation
ûû" /
=
ûû0 1#
DocumentationProvider
ûû2 G
.
ûûG H
GetDocumentation
ûûH X
(
ûûX Y
field
ûûY ^
)
ûû^ _
;
ûû_ `
}
üü 
enumDescription
†† #
.
††# $
Values
††$ *
.
††* +
Add
††+ .
(
††. /
	enumValue
††/ 8
)
††8 9
;
††9 :
}
°° 
}
¢¢ 
GeneratedModels
££ 
.
££ 
Add
££ 
(
££  
enumDescription
££  /
.
££/ 0
Name
££0 4
,
££4 5
enumDescription
££6 E
)
££E F
;
££F G
return
•• 
enumDescription
•• "
;
••" #
}
¶¶ 	
private
®® *
KeyValuePairModelDescription
®® ,2
$GenerateKeyValuePairModelDescription
®®- Q
(
®®Q R
Type
®®R V
	modelType
®®W `
,
®®` a
Type
®®b f
keyType
®®g n
,
®®n o
Type
®®p t
	valueType
®®u ~
)
®®~ 
{
©© 	
ModelDescription
™™ !
keyModelDescription
™™ 0
=
™™1 2)
GetOrCreateModelDescription
™™3 N
(
™™N O
keyType
™™O V
)
™™V W
;
™™W X
ModelDescription
´´ #
valueModelDescription
´´ 2
=
´´3 4)
GetOrCreateModelDescription
´´5 P
(
´´P Q
	valueType
´´Q Z
)
´´Z [
;
´´[ \
return
≠≠ 
new
≠≠ *
KeyValuePairModelDescription
≠≠ 3
{
ÆÆ 
Name
ØØ 
=
ØØ 
ModelNameHelper
ØØ &
.
ØØ& '
GetModelName
ØØ' 3
(
ØØ3 4
	modelType
ØØ4 =
)
ØØ= >
,
ØØ> ?
	ModelType
∞∞ 
=
∞∞ 
	modelType
∞∞ %
,
∞∞% &!
KeyModelDescription
±± #
=
±±$ %!
keyModelDescription
±±& 9
,
±±9 :#
ValueModelDescription
≤≤ %
=
≤≤& '#
valueModelDescription
≤≤( =
}
≥≥ 
;
≥≥ 
}
¥¥ 	
private
∂∂ 
ModelDescription
∂∂  0
"GenerateSimpleTypeModelDescription
∂∂! C
(
∂∂C D
Type
∂∂D H
	modelType
∂∂I R
)
∂∂R S
{
∑∑ 	(
SimpleTypeModelDescription
∏∏ &$
simpleModelDescription
∏∏' =
=
∏∏> ?
new
∏∏@ C(
SimpleTypeModelDescription
∏∏D ^
{
ππ 
Name
∫∫ 
=
∫∫ 
ModelNameHelper
∫∫ &
.
∫∫& '
GetModelName
∫∫' 3
(
∫∫3 4
	modelType
∫∫4 =
)
∫∫= >
,
∫∫> ?
	ModelType
ªª 
=
ªª 
	modelType
ªª %
,
ªª% &
Documentation
ºº 
=
ºº (
CreateDefaultDocumentation
ºº  :
(
ºº: ;
	modelType
ºº; D
)
ººD E
}
ΩΩ 
;
ΩΩ 
GeneratedModels
ææ 
.
ææ 
Add
ææ 
(
ææ  $
simpleModelDescription
ææ  6
.
ææ6 7
Name
ææ7 ;
,
ææ; <$
simpleModelDescription
ææ= S
)
ææS T
;
ææT U
return
¿¿ $
simpleModelDescription
¿¿ )
;
¿¿) *
}
¡¡ 	
}
¬¬ 
}√√ ‹

ßC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\ModelDescriptions\ModelNameAttribute.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
.$ %
ModelDescriptions% 6
{ 
[ 
AttributeUsage 
( 
AttributeTargets $
.$ %
Class% *
|+ ,
AttributeTargets- =
.= >
Struct> D
|E F
AttributeTargetsG W
.W X
EnumX \
,\ ]
AllowMultiple^ k
=l m
falsen s
,s t
	Inheritedu ~
=	 Ä
false
Å Ü
)
Ü á
]
á à
public		 

sealed		 
class		 
ModelNameAttribute		 *
:		+ ,
	Attribute		- 6
{

 
public 
ModelNameAttribute !
(! "
string" (
name) -
)- .
{ 	
Name 
= 
name 
; 
} 	
public 
string 
Name 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
} 
} Á
§C:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\ModelDescriptions\ModelNameHelper.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
.$ %
ModelDescriptions% 6
{ 
internal 
static 
class 
ModelNameHelper )
{		 
public 
static 
string 
GetModelName )
() *
Type* .
type/ 3
)3 4
{ 	
ModelNameAttribute 
modelNameAttribute 1
=2 3
type4 8
.8 9
GetCustomAttribute9 K
<K L
ModelNameAttributeL ^
>^ _
(_ `
)` a
;a b
if 
( 
modelNameAttribute "
!=# %
null& *
&&+ -
!. /
String/ 5
.5 6
IsNullOrEmpty6 C
(C D
modelNameAttributeD V
.V W
NameW [
)[ \
)\ ]
{ 
return 
modelNameAttribute )
.) *
Name* .
;. /
} 
string 
	modelName 
= 
type #
.# $
Name$ (
;( )
if 
( 
type 
. 
IsGenericType "
)" #
{ 
Type 
genericType  
=! "
type# '
.' ($
GetGenericTypeDefinition( @
(@ A
)A B
;B C
Type 
[ 
] 
genericArguments '
=( )
type* .
.. /
GetGenericArguments/ B
(B C
)C D
;D E
string 
genericTypeName &
=' (
genericType) 4
.4 5
Name5 9
;9 :
genericTypeName 
=  !
genericTypeName" 1
.1 2
	Substring2 ;
(; <
$num< =
,= >
genericTypeName? N
.N O
IndexOfO V
(V W
$charW Z
)Z [
)[ \
;\ ]
string 
[ 
] 
argumentTypeNames *
=+ ,
genericArguments- =
.= >
Select> D
(D E
tE F
=>G I
GetModelNameJ V
(V W
tW X
)X Y
)Y Z
.Z [
ToArray[ b
(b c
)c d
;d e
	modelName 
= 
String "
." #
Format# )
() *
CultureInfo* 5
.5 6
InvariantCulture6 F
,F G
$strH R
,R S
genericTypeNameT c
,c d
Stringe k
.k l
Joinl p
(p q
$strq v
,v w
argumentTypeNames	x â
)
â ä
)
ä ã
;
ã å
} 
return!! 
	modelName!! 
;!! 
}"" 	
}## 
}$$ ô
®C:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\ModelDescriptions\ParameterAnnotation.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
.$ %
ModelDescriptions% 6
{ 
public 

class 
ParameterAnnotation $
{ 
public 
	Attribute 
AnnotationAttribute ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public		 
string		 
Documentation		 #
{		$ %
get		& )
;		) *
set		+ .
;		. /
}		0 1
}

 
} ‹
©C:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\ModelDescriptions\ParameterDescription.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
.$ %
ModelDescriptions% 6
{ 
public 

class  
ParameterDescription %
{ 
public  
ParameterDescription #
(# $
)$ %
{		 	
Annotations

 
=

 
new

 

Collection

 (
<

( )
ParameterAnnotation

) <
>

< =
(

= >
)

> ?
;

? @
} 	
public 

Collection 
< 
ParameterAnnotation -
>- .
Annotations/ :
{; <
get= @
;@ A
privateB I
setJ M
;M N
}O P
public 
string 
Documentation #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
ModelDescription 
TypeDescription  /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
} 
} â
ØC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\ModelDescriptions\SimpleTypeModelDescription.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
.$ %
ModelDescriptions% 6
{ 
public 

class &
SimpleTypeModelDescription +
:, -
ModelDescription. >
{ 
} 
} “*
öC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\Models\HelpPageApiModel.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
.$ %
Models% +
{ 
public 

class 
HelpPageApiModel !
{ 
public 
HelpPageApiModel 
(  
)  !
{ 	
UriParameters 
= 
new 

Collection  *
<* + 
ParameterDescription+ ?
>? @
(@ A
)A B
;B C
SampleRequests 
= 
new  

Dictionary! +
<+ , 
MediaTypeHeaderValue, @
,@ A
objectB H
>H I
(I J
)J K
;K L
SampleResponses 
= 
new !

Dictionary" ,
<, - 
MediaTypeHeaderValue- A
,A B
objectC I
>I J
(J K
)K L
;L M
ErrorMessages 
= 
new 

Collection  *
<* +
string+ 1
>1 2
(2 3
)3 4
;4 5
} 	
public 
ApiDescription 
ApiDescription ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public!! 

Collection!! 
<!!  
ParameterDescription!! .
>!!. /
UriParameters!!0 =
{!!> ?
get!!@ C
;!!C D
private!!E L
set!!M P
;!!P Q
}!!R S
public&& 
string&&  
RequestDocumentation&& *
{&&+ ,
get&&- 0
;&&0 1
set&&2 5
;&&5 6
}&&7 8
public++ 
ModelDescription++ #
RequestModelDescription++  7
{++8 9
get++: =
;++= >
set++? B
;++B C
}++D E
public00 
IList00 
<00  
ParameterDescription00 )
>00) *!
RequestBodyParameters00+ @
{11 	
get22 
{33 
return44 $
GetParameterDescriptions44 /
(44/ 0#
RequestModelDescription440 G
)44G H
;44H I
}55 
}66 	
public;; 
ModelDescription;; 
ResourceDescription;;  3
{;;4 5
get;;6 9
;;;9 :
set;;; >
;;;> ?
};;@ A
public@@ 
IList@@ 
<@@  
ParameterDescription@@ )
>@@) *
ResourceProperties@@+ =
{AA 	
getBB 
{CC 
returnDD $
GetParameterDescriptionsDD /
(DD/ 0
ResourceDescriptionDD0 C
)DDC D
;DDD E
}EE 
}FF 	
publicKK 
IDictionaryKK 
<KK  
MediaTypeHeaderValueKK /
,KK/ 0
objectKK1 7
>KK7 8
SampleRequestsKK9 G
{KKH I
getKKJ M
;KKM N
privateKKO V
setKKW Z
;KKZ [
}KK\ ]
publicPP 
IDictionaryPP 
<PP  
MediaTypeHeaderValuePP /
,PP/ 0
objectPP1 7
>PP7 8
SampleResponsesPP9 H
{PPI J
getPPK N
;PPN O
privatePPP W
setPPX [
;PP[ \
}PP] ^
publicUU 

CollectionUU 
<UU 
stringUU  
>UU  !
ErrorMessagesUU" /
{UU0 1
getUU2 5
;UU5 6
privateUU7 >
setUU? B
;UUB C
}UUD E
privateWW 
staticWW 
IListWW 
<WW  
ParameterDescriptionWW 1
>WW1 2$
GetParameterDescriptionsWW3 K
(WWK L
ModelDescriptionWWL \
modelDescriptionWW] m
)WWm n
{XX 	'
ComplexTypeModelDescriptionYY ''
complexTypeModelDescriptionYY( C
=YYD E
modelDescriptionYYF V
asYYW Y'
ComplexTypeModelDescriptionYYZ u
;YYu v
ifZZ 
(ZZ '
complexTypeModelDescriptionZZ +
!=ZZ, .
nullZZ/ 3
)ZZ3 4
{[[ 
return\\ '
complexTypeModelDescription\\ 2
.\\2 3

Properties\\3 =
;\\= >
}]] &
CollectionModelDescription__ &&
collectionModelDescription__' A
=__B C
modelDescription__D T
as__U W&
CollectionModelDescription__X r
;__r s
if`` 
(`` &
collectionModelDescription`` *
!=``+ -
null``. 2
)``2 3
{aa '
complexTypeModelDescriptionbb +
=bb, -&
collectionModelDescriptionbb. H
.bbH I
ElementDescriptionbbI [
asbb\ ^'
ComplexTypeModelDescriptionbb_ z
;bbz {
ifcc 
(cc '
complexTypeModelDescriptioncc /
!=cc0 2
nullcc3 7
)cc7 8
{dd 
returnee '
complexTypeModelDescriptionee 6
.ee6 7

Propertiesee7 A
;eeA B
}ff 
}gg 
returnii 
nullii 
;ii 
}jj 	
}kk 
}ll °ô
´C:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\SampleGeneration\HelpPageSampleGenerator.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
{ 
public 

class #
HelpPageSampleGenerator (
{ 
public #
HelpPageSampleGenerator &
(& '
)' (
{ 	"
ActualHttpMessageTypes "
=# $
new% (

Dictionary) 3
<3 4
HelpPageSampleKey4 E
,E F
TypeG K
>K L
(L M
)M N
;N O
ActionSamples 
= 
new 

Dictionary  *
<* +
HelpPageSampleKey+ <
,< =
object> D
>D E
(E F
)F G
;G H
SampleObjects 
= 
new 

Dictionary  *
<* +
Type+ /
,/ 0
object1 7
>7 8
(8 9
)9 :
;: ;!
SampleObjectFactories !
=" #
new$ '
List( ,
<, -
Func- 1
<1 2#
HelpPageSampleGenerator2 I
,I J
TypeK O
,O P
objectQ W
>W X
>X Y
{   &
DefaultSampleObjectFactory!! *
,!!* +
}"" 
;"" 
}## 	
public(( 
IDictionary(( 
<(( 
HelpPageSampleKey(( ,
,((, -
Type((. 2
>((2 3"
ActualHttpMessageTypes((4 J
{((K L
get((M P
;((P Q
internal((R Z
set(([ ^
;((^ _
}((` a
public-- 
IDictionary-- 
<-- 
HelpPageSampleKey-- ,
,--, -
object--. 4
>--4 5
ActionSamples--6 C
{--D E
get--F I
;--I J
internal--K S
set--T W
;--W X
}--Y Z
public22 
IDictionary22 
<22 
Type22 
,22  
object22! '
>22' (
SampleObjects22) 6
{227 8
get229 <
;22< =
internal22> F
set22G J
;22J K
}22L M
[<< 	
SuppressMessage<<	 
(<< 
$str<< +
,<<+ ,
$str<<- ]
,<<] ^
Justification== 
=== 
$str== M
)==M N
]==N O
public>> 
IList>> 
<>> 
Func>> 
<>> #
HelpPageSampleGenerator>> 1
,>>1 2
Type>>3 7
,>>7 8
object>>9 ?
>>>? @
>>>@ A!
SampleObjectFactories>>B W
{>>X Y
get>>Z ]
;>>] ^
private>>_ f
set>>g j
;>>j k
}>>l m
publicEE 
IDictionaryEE 
<EE  
MediaTypeHeaderValueEE /
,EE/ 0
objectEE1 7
>EE7 8
GetSampleRequestsEE9 J
(EEJ K
ApiDescriptionEEK Y
apiEEZ ]
)EE] ^
{FF 	
returnGG 
	GetSampleGG 
(GG 
apiGG  
,GG  !
SampleDirectionGG" 1
.GG1 2
RequestGG2 9
)GG9 :
;GG: ;
}HH 	
publicOO 
IDictionaryOO 
<OO  
MediaTypeHeaderValueOO /
,OO/ 0
objectOO1 7
>OO7 8
GetSampleResponsesOO9 K
(OOK L
ApiDescriptionOOL Z
apiOO[ ^
)OO^ _
{PP 	
returnQQ 
	GetSampleQQ 
(QQ 
apiQQ  
,QQ  !
SampleDirectionQQ" 1
.QQ1 2
ResponseQQ2 :
)QQ: ;
;QQ; <
}RR 	
publicZZ 
virtualZZ 
IDictionaryZZ "
<ZZ" # 
MediaTypeHeaderValueZZ# 7
,ZZ7 8
objectZZ9 ?
>ZZ? @
	GetSampleZZA J
(ZZJ K
ApiDescriptionZZK Y
apiZZZ ]
,ZZ] ^
SampleDirectionZZ_ n
sampleDirectionZZo ~
)ZZ~ 
{[[ 	
if\\ 
(\\ 
api\\ 
==\\ 
null\\ 
)\\ 
{]] 
throw^^ 
new^^ !
ArgumentNullException^^ /
(^^/ 0
$str^^0 5
)^^5 6
;^^6 7
}__ 
string`` 
controllerName`` !
=``" #
api``$ '
.``' (
ActionDescriptor``( 8
.``8 9 
ControllerDescriptor``9 M
.``M N
ControllerName``N \
;``\ ]
stringaa 

actionNameaa 
=aa 
apiaa  #
.aa# $
ActionDescriptoraa$ 4
.aa4 5

ActionNameaa5 ?
;aa? @
IEnumerablebb 
<bb 
stringbb 
>bb 
parameterNamesbb  .
=bb/ 0
apibb1 4
.bb4 5!
ParameterDescriptionsbb5 J
.bbJ K
SelectbbK Q
(bbQ R
pbbR S
=>bbT V
pbbW X
.bbX Y
NamebbY ]
)bb] ^
;bb^ _

Collectioncc 
<cc 
MediaTypeFormattercc )
>cc) *

formatterscc+ 5
;cc5 6
Typedd 
typedd 
=dd 
ResolveTypedd #
(dd# $
apidd$ '
,dd' (
controllerNamedd) 7
,dd7 8

actionNamedd9 C
,ddC D
parameterNamesddE S
,ddS T
sampleDirectionddU d
,ddd e
outddf i

formattersddj t
)ddt u
;ddu v
varee 
samplesee 
=ee 
newee 

Dictionaryee (
<ee( ) 
MediaTypeHeaderValueee) =
,ee= >
objectee? E
>eeE F
(eeF G
)eeG H
;eeH I
varhh 
actionSampleshh 
=hh 
GetAllActionSampleshh  3
(hh3 4
controllerNamehh4 B
,hhB C

actionNamehhD N
,hhN O
parameterNameshhP ^
,hh^ _
sampleDirectionhh` o
)hho p
;hhp q
foreachii 
(ii 
varii 
actionSampleii %
inii& (
actionSamplesii) 6
)ii6 7
{jj 
sampleskk 
.kk 
Addkk 
(kk 
actionSamplekk (
.kk( )
Keykk) ,
.kk, -
	MediaTypekk- 6
,kk6 7
WrapSampleIfStringkk8 J
(kkJ K
actionSamplekkK W
.kkW X
ValuekkX ]
)kk] ^
)kk^ _
;kk_ `
}ll 
ifpp 
(pp 
typepp 
!=pp 
nullpp 
&&pp 
!pp  !
typeofpp! '
(pp' (
HttpResponseMessagepp( ;
)pp; <
.pp< =
IsAssignableFrompp= M
(ppM N
typeppN R
)ppR S
)ppS T
{qq 
objectrr 
sampleObjectrr #
=rr$ %
GetSampleObjectrr& 5
(rr5 6
typerr6 :
)rr: ;
;rr; <
foreachss 
(ss 
varss 
	formatterss &
inss' )

formattersss* 4
)ss4 5
{tt 
foreachuu 
(uu  
MediaTypeHeaderValueuu 1
	mediaTypeuu2 ;
inuu< >
	formatteruu? H
.uuH I
SupportedMediaTypesuuI \
)uu\ ]
{vv 
ifww 
(ww 
!ww 
samplesww $
.ww$ %
ContainsKeyww% 0
(ww0 1
	mediaTypeww1 :
)ww: ;
)ww; <
{xx 
objectyy "
sampleyy# )
=yy* +
GetActionSampleyy, ;
(yy; <
controllerNameyy< J
,yyJ K

actionNameyyL V
,yyV W
parameterNamesyyX f
,yyf g
typeyyh l
,yyl m
	formatteryyn w
,yyw x
	mediaType	yyy Ç
,
yyÇ É
sampleDirection
yyÑ ì
)
yyì î
;
yyî ï
if|| 
(||  
sample||  &
==||' )
null||* .
&&||/ 1
sampleObject||2 >
!=||? A
null||B F
)||F G
{}} 
sample~~  &
=~~' (+
WriteSampleObjectUsingFormatter~~) H
(~~H I
	formatter~~I R
,~~R S
sampleObject~~T `
,~~` a
type~~b f
,~~f g
	mediaType~~h q
)~~q r
;~~r s
} 
samples
ÅÅ #
.
ÅÅ# $
Add
ÅÅ$ '
(
ÅÅ' (
	mediaType
ÅÅ( 1
,
ÅÅ1 2 
WrapSampleIfString
ÅÅ3 E
(
ÅÅE F
sample
ÅÅF L
)
ÅÅL M
)
ÅÅM N
;
ÅÅN O
}
ÇÇ 
}
ÉÉ 
}
ÑÑ 
}
ÖÖ 
return
áá 
samples
áá 
;
áá 
}
àà 	
public
ïï 
virtual
ïï 
object
ïï 
GetActionSample
ïï -
(
ïï- .
string
ïï. 4
controllerName
ïï5 C
,
ïïC D
string
ïïE K

actionName
ïïL V
,
ïïV W
IEnumerable
ïïX c
<
ïïc d
string
ïïd j
>
ïïj k
parameterNames
ïïl z
,
ïïz {
Typeïï| Ä
typeïïÅ Ö
,ïïÖ Ü"
MediaTypeFormatterïïá ô
	formatterïïö £
,ïï£ §$
MediaTypeHeaderValueïï• π
	mediaTypeïï∫ √
,ïï√ ƒ
SampleDirectionïï≈ ‘
sampleDirectionïï’ ‰
)ïï‰ Â
{
ññ 	
object
óó 
sample
óó 
;
óó 
if
ùù 
(
ùù 
ActionSamples
ùù 
.
ùù 
TryGetValue
ùù )
(
ùù) *
new
ùù* -
HelpPageSampleKey
ùù. ?
(
ùù? @
	mediaType
ùù@ I
,
ùùI J
sampleDirection
ùùK Z
,
ùùZ [
controllerName
ùù\ j
,
ùùj k

actionName
ùùl v
,
ùùv w
parameterNamesùùx Ü
)ùùÜ á
,ùùá à
outùùâ å
sampleùùç ì
)ùùì î
||ùùï ó
ActionSamples
ûû 
.
ûû 
TryGetValue
ûû )
(
ûû) *
new
ûû* -
HelpPageSampleKey
ûû. ?
(
ûû? @
	mediaType
ûû@ I
,
ûûI J
sampleDirection
ûûK Z
,
ûûZ [
controllerName
ûû\ j
,
ûûj k

actionName
ûûl v
,
ûûv w
new
ûûx {
[
ûû{ |
]
ûû| }
{
ûû~ 
$strûûÄ É
}ûûÑ Ö
)ûûÖ Ü
,ûûÜ á
outûûà ã
sampleûûå í
)ûûí ì
||ûûî ñ
ActionSamples
üü 
.
üü 
TryGetValue
üü )
(
üü) *
new
üü* -
HelpPageSampleKey
üü. ?
(
üü? @
	mediaType
üü@ I
,
üüI J
type
üüK O
)
üüO P
,
üüP Q
out
üüR U
sample
üüV \
)
üü\ ]
||
üü^ `
ActionSamples
†† 
.
†† 
TryGetValue
†† )
(
††) *
new
††* -
HelpPageSampleKey
††. ?
(
††? @
	mediaType
††@ I
)
††I J
,
††J K
out
††L O
sample
††P V
)
††V W
)
††W X
{
°° 
return
¢¢ 
sample
¢¢ 
;
¢¢ 
}
££ 
return
•• 
null
•• 
;
•• 
}
¶¶ 	
[
∞∞ 	
SuppressMessage
∞∞	 
(
∞∞ 
$str
∞∞ +
,
∞∞+ ,
$str
∞∞- U
,
∞∞U V
Justification
±± 
=
±± 
$str
±± z
)
±±z {
]
±±{ |
public
≤≤ 
virtual
≤≤ 
object
≤≤ 
GetSampleObject
≤≤ -
(
≤≤- .
Type
≤≤. 2
type
≤≤3 7
)
≤≤7 8
{
≥≥ 	
object
¥¥ 
sampleObject
¥¥ 
;
¥¥  
if
∂∂ 
(
∂∂ 
!
∂∂ 
SampleObjects
∂∂ 
.
∂∂ 
TryGetValue
∂∂ *
(
∂∂* +
type
∂∂+ /
,
∂∂/ 0
out
∂∂1 4
sampleObject
∂∂5 A
)
∂∂A B
)
∂∂B C
{
∑∑ 
foreach
ππ 
(
ππ 
Func
ππ 
<
ππ %
HelpPageSampleGenerator
ππ 5
,
ππ5 6
Type
ππ7 ;
,
ππ; <
object
ππ= C
>
ππC D
factory
ππE L
in
ππM O#
SampleObjectFactories
ππP e
)
ππe f
{
∫∫ 
if
ªª 
(
ªª 
factory
ªª 
==
ªª  "
null
ªª# '
)
ªª' (
{
ºº 
continue
ΩΩ  
;
ΩΩ  !
}
ææ 
try
¿¿ 
{
¡¡ 
sampleObject
¬¬ $
=
¬¬% &
factory
¬¬' .
(
¬¬. /
this
¬¬/ 3
,
¬¬3 4
type
¬¬5 9
)
¬¬9 :
;
¬¬: ;
if
√√ 
(
√√ 
sampleObject
√√ (
!=
√√) +
null
√√, 0
)
√√0 1
{
ƒƒ 
break
≈≈ !
;
≈≈! "
}
∆∆ 
}
«« 
catch
»» 
{
…… 
}
ÀÀ 
}
ÃÃ 
}
ÕÕ 
return
œœ 
sampleObject
œœ 
;
œœ  
}
–– 	
public
◊◊ 
virtual
◊◊ 
Type
◊◊ +
ResolveHttpRequestMessageType
◊◊ 9
(
◊◊9 :
ApiDescription
◊◊: H
api
◊◊I L
)
◊◊L M
{
ÿÿ 	
string
ŸŸ 
controllerName
ŸŸ !
=
ŸŸ" #
api
ŸŸ$ '
.
ŸŸ' (
ActionDescriptor
ŸŸ( 8
.
ŸŸ8 9"
ControllerDescriptor
ŸŸ9 M
.
ŸŸM N
ControllerName
ŸŸN \
;
ŸŸ\ ]
string
⁄⁄ 

actionName
⁄⁄ 
=
⁄⁄ 
api
⁄⁄  #
.
⁄⁄# $
ActionDescriptor
⁄⁄$ 4
.
⁄⁄4 5

ActionName
⁄⁄5 ?
;
⁄⁄? @
IEnumerable
€€ 
<
€€ 
string
€€ 
>
€€ 
parameterNames
€€  .
=
€€/ 0
api
€€1 4
.
€€4 5#
ParameterDescriptions
€€5 J
.
€€J K
Select
€€K Q
(
€€Q R
p
€€R S
=>
€€T V
p
€€W X
.
€€X Y
Name
€€Y ]
)
€€] ^
;
€€^ _

Collection
‹‹ 
<
‹‹  
MediaTypeFormatter
‹‹ )
>
‹‹) *

formatters
‹‹+ 5
;
‹‹5 6
return
›› 
ResolveType
›› 
(
›› 
api
›› "
,
››" #
controllerName
››$ 2
,
››2 3

actionName
››4 >
,
››> ?
parameterNames
››@ N
,
››N O
SampleDirection
››P _
.
››_ `
Request
››` g
,
››g h
out
››i l

formatters
››m w
)
››w x
;
››x y
}
ﬁﬁ 	
[
ÈÈ 	
SuppressMessage
ÈÈ	 
(
ÈÈ 
$str
ÈÈ +
,
ÈÈ+ ,
$str
ÈÈ- H
,
ÈÈH I
Justification
ÈÈJ W
=
ÈÈX Y
$strÈÈZ Ñ
)ÈÈÑ Ö
]ÈÈÖ Ü
public
ÍÍ 
virtual
ÍÍ 
Type
ÍÍ 
ResolveType
ÍÍ '
(
ÍÍ' (
ApiDescription
ÍÍ( 6
api
ÍÍ7 :
,
ÍÍ: ;
string
ÍÍ< B
controllerName
ÍÍC Q
,
ÍÍQ R
string
ÍÍS Y

actionName
ÍÍZ d
,
ÍÍd e
IEnumerable
ÍÍf q
<
ÍÍq r
string
ÍÍr x
>
ÍÍx y
parameterNamesÍÍz à
,ÍÍà â
SampleDirectionÍÍä ô
sampleDirectionÍÍö ©
,ÍÍ© ™
outÍÍ´ Æ

CollectionÍÍØ π
<ÍÍπ ∫"
MediaTypeFormatterÍÍ∫ Ã
>ÍÍÃ Õ

formattersÍÍŒ ÿ
)ÍÍÿ Ÿ
{
ÎÎ 	
if
ÏÏ 
(
ÏÏ 
!
ÏÏ 
Enum
ÏÏ 
.
ÏÏ 
	IsDefined
ÏÏ 
(
ÏÏ  
typeof
ÏÏ  &
(
ÏÏ& '
SampleDirection
ÏÏ' 6
)
ÏÏ6 7
,
ÏÏ7 8
sampleDirection
ÏÏ9 H
)
ÏÏH I
)
ÏÏI J
{
ÌÌ 
throw
ÓÓ 
new
ÓÓ *
InvalidEnumArgumentException
ÓÓ 6
(
ÓÓ6 7
$str
ÓÓ7 H
,
ÓÓH I
(
ÓÓJ K
int
ÓÓK N
)
ÓÓN O
sampleDirection
ÓÓO ^
,
ÓÓ^ _
typeof
ÓÓ` f
(
ÓÓf g
SampleDirection
ÓÓg v
)
ÓÓv w
)
ÓÓw x
;
ÓÓx y
}
ÔÔ 
if
 
(
 
api
 
==
 
null
 
)
 
{
ÒÒ 
throw
ÚÚ 
new
ÚÚ #
ArgumentNullException
ÚÚ /
(
ÚÚ/ 0
$str
ÚÚ0 5
)
ÚÚ5 6
;
ÚÚ6 7
}
ÛÛ 
Type
ÙÙ 
type
ÙÙ 
;
ÙÙ 
if
ıı 
(
ıı $
ActualHttpMessageTypes
ıı &
.
ıı& '
TryGetValue
ıı' 2
(
ıı2 3
new
ıı3 6
HelpPageSampleKey
ıı7 H
(
ııH I
sampleDirection
ııI X
,
ııX Y
controllerName
ııZ h
,
ııh i

actionName
ııj t
,
ııt u
parameterNamesııv Ñ
)ııÑ Ö
,ııÖ Ü
outııá ä
typeııã è
)ııè ê
||ııë ì$
ActualHttpMessageTypes
ˆˆ &
.
ˆˆ& '
TryGetValue
ˆˆ' 2
(
ˆˆ2 3
new
ˆˆ3 6
HelpPageSampleKey
ˆˆ7 H
(
ˆˆH I
sampleDirection
ˆˆI X
,
ˆˆX Y
controllerName
ˆˆZ h
,
ˆˆh i

actionName
ˆˆj t
,
ˆˆt u
new
ˆˆv y
[
ˆˆy z
]
ˆˆz {
{
ˆˆ| }
$strˆˆ~ Å
}ˆˆÇ É
)ˆˆÉ Ñ
,ˆˆÑ Ö
outˆˆÜ â
typeˆˆä é
)ˆˆé è
)ˆˆè ê
{
˜˜ 

Collection
˘˘ 
<
˘˘  
MediaTypeFormatter
˘˘ -
>
˘˘- .
newFormatters
˘˘/ <
=
˘˘= >
new
˘˘? B

Collection
˘˘C M
<
˘˘M N 
MediaTypeFormatter
˘˘N `
>
˘˘` a
(
˘˘a b
)
˘˘b c
;
˘˘c d
foreach
˙˙ 
(
˙˙ 
var
˙˙ 
	formatter
˙˙ &
in
˙˙' )
api
˙˙* -
.
˙˙- .
ActionDescriptor
˙˙. >
.
˙˙> ?
Configuration
˙˙? L
.
˙˙L M

Formatters
˙˙M W
)
˙˙W X
{
˚˚ 
if
¸¸ 
(
¸¸ 
IsFormatSupported
¸¸ )
(
¸¸) *
sampleDirection
¸¸* 9
,
¸¸9 :
	formatter
¸¸; D
,
¸¸D E
type
¸¸F J
)
¸¸J K
)
¸¸K L
{
˝˝ 
newFormatters
˛˛ %
.
˛˛% &
Add
˛˛& )
(
˛˛) *
	formatter
˛˛* 3
)
˛˛3 4
;
˛˛4 5
}
ˇˇ 
}
ÄÄ 

formatters
ÅÅ 
=
ÅÅ 
newFormatters
ÅÅ *
;
ÅÅ* +
}
ÇÇ 
else
ÉÉ 
{
ÑÑ 
switch
ÖÖ 
(
ÖÖ 
sampleDirection
ÖÖ '
)
ÖÖ' (
{
ÜÜ 
case
áá 
SampleDirection
áá (
.
áá( )
Request
áá) 0
:
áá0 1%
ApiParameterDescription
àà /"
requestBodyParameter
àà0 D
=
ààE F
api
ààG J
.
ààJ K#
ParameterDescriptions
ààK `
.
àà` a
FirstOrDefault
ààa o
(
àào p
p
ààp q
=>
ààr t
p
ààu v
.
ààv w
Source
ààw }
==àà~ Ä"
ApiParameterSourceààÅ ì
.ààì î
FromBodyààî ú
)ààú ù
;ààù û
type
ââ 
=
ââ "
requestBodyParameter
ââ 3
==
ââ4 6
null
ââ7 ;
?
ââ< =
null
ââ> B
:
ââC D"
requestBodyParameter
ââE Y
.
ââY Z!
ParameterDescriptor
ââZ m
.
ââm n
ParameterType
âân {
;
ââ{ |

formatters
ää "
=
ää# $
api
ää% (
.
ää( ),
SupportedRequestBodyFormatters
ää) G
;
ääG H
break
ãã 
;
ãã 
case
åå 
SampleDirection
åå (
.
åå( )
Response
åå) 1
:
åå1 2
default
çç 
:
çç 
type
éé 
=
éé 
api
éé "
.
éé" #!
ResponseDescription
éé# 6
.
éé6 7
ResponseType
éé7 C
??
ééD F
api
ééG J
.
ééJ K!
ResponseDescription
ééK ^
.
éé^ _
DeclaredType
éé_ k
;
éék l

formatters
èè "
=
èè# $
api
èè% (
.
èè( ))
SupportedResponseFormatters
èè) D
;
èèD E
break
êê 
;
êê 
}
ëë 
}
íí 
return
îî 
type
îî 
;
îî 
}
ïï 	
[
üü 	
SuppressMessage
üü	 
(
üü 
$str
üü +
,
üü+ ,
$str
üü- U
,
üüU V
Justification
üüW d
=
üüe f
$strüüg î
)üüî ï
]üüï ñ
public
†† 
virtual
†† 
object
†† -
WriteSampleObjectUsingFormatter
†† =
(
††= > 
MediaTypeFormatter
††> P
	formatter
††Q Z
,
††Z [
object
††\ b
value
††c h
,
††h i
Type
††j n
type
††o s
,
††s t#
MediaTypeHeaderValue††u â
	mediaType††ä ì
)††ì î
{
°° 	
if
¢¢ 
(
¢¢ 
	formatter
¢¢ 
==
¢¢ 
null
¢¢ !
)
¢¢! "
{
££ 
throw
§§ 
new
§§ #
ArgumentNullException
§§ /
(
§§/ 0
$str
§§0 ;
)
§§; <
;
§§< =
}
•• 
if
¶¶ 
(
¶¶ 
	mediaType
¶¶ 
==
¶¶ 
null
¶¶ !
)
¶¶! "
{
ßß 
throw
®® 
new
®® #
ArgumentNullException
®® /
(
®®/ 0
$str
®®0 ;
)
®®; <
;
®®< =
}
©© 
object
´´ 
sample
´´ 
=
´´ 
String
´´ "
.
´´" #
Empty
´´# (
;
´´( )
MemoryStream
¨¨ 
ms
¨¨ 
=
¨¨ 
null
¨¨ "
;
¨¨" #
HttpContent
≠≠ 
content
≠≠ 
=
≠≠  !
null
≠≠" &
;
≠≠& '
try
ÆÆ 
{
ØØ 
if
∞∞ 
(
∞∞ 
	formatter
∞∞ 
.
∞∞ 
CanWriteType
∞∞ *
(
∞∞* +
type
∞∞+ /
)
∞∞/ 0
)
∞∞0 1
{
±± 
ms
≤≤ 
=
≤≤ 
new
≤≤ 
MemoryStream
≤≤ )
(
≤≤) *
)
≤≤* +
;
≤≤+ ,
content
≥≥ 
=
≥≥ 
new
≥≥ !
ObjectContent
≥≥" /
(
≥≥/ 0
type
≥≥0 4
,
≥≥4 5
value
≥≥6 ;
,
≥≥; <
	formatter
≥≥= F
,
≥≥F G
	mediaType
≥≥H Q
)
≥≥Q R
;
≥≥R S
	formatter
¥¥ 
.
¥¥  
WriteToStreamAsync
¥¥ 0
(
¥¥0 1
type
¥¥1 5
,
¥¥5 6
value
¥¥7 <
,
¥¥< =
ms
¥¥> @
,
¥¥@ A
content
¥¥B I
,
¥¥I J
null
¥¥K O
)
¥¥O P
.
¥¥P Q
Wait
¥¥Q U
(
¥¥U V
)
¥¥V W
;
¥¥W X
ms
µµ 
.
µµ 
Position
µµ 
=
µµ  !
$num
µµ" #
;
µµ# $
StreamReader
∂∂  
reader
∂∂! '
=
∂∂( )
new
∂∂* -
StreamReader
∂∂. :
(
∂∂: ;
ms
∂∂; =
)
∂∂= >
;
∂∂> ?
string
∑∑ $
serializedSampleString
∑∑ 1
=
∑∑2 3
reader
∑∑4 :
.
∑∑: ;
	ReadToEnd
∑∑; D
(
∑∑D E
)
∑∑E F
;
∑∑F G
if
∏∏ 
(
∏∏ 
	mediaType
∏∏ !
.
∏∏! "
	MediaType
∏∏" +
.
∏∏+ ,
ToUpperInvariant
∏∏, <
(
∏∏< =
)
∏∏= >
.
∏∏> ?
Contains
∏∏? G
(
∏∏G H
$str
∏∏H M
)
∏∏M N
)
∏∏N O
{
ππ $
serializedSampleString
∫∫ .
=
∫∫/ 0
TryFormatXml
∫∫1 =
(
∫∫= >$
serializedSampleString
∫∫> T
)
∫∫T U
;
∫∫U V
}
ªª 
else
ºº 
if
ºº 
(
ºº 
	mediaType
ºº &
.
ºº& '
	MediaType
ºº' 0
.
ºº0 1
ToUpperInvariant
ºº1 A
(
ººA B
)
ººB C
.
ººC D
Contains
ººD L
(
ººL M
$str
ººM S
)
ººS T
)
ººT U
{
ΩΩ $
serializedSampleString
ææ .
=
ææ/ 0
TryFormatJson
ææ1 >
(
ææ> ?$
serializedSampleString
ææ? U
)
ææU V
;
ææV W
}
øø 
sample
¡¡ 
=
¡¡ 
new
¡¡  

TextSample
¡¡! +
(
¡¡+ ,$
serializedSampleString
¡¡, B
)
¡¡B C
;
¡¡C D
}
¬¬ 
else
√√ 
{
ƒƒ 
sample
≈≈ 
=
≈≈ 
new
≈≈  
InvalidSample
≈≈! .
(
≈≈. /
String
≈≈/ 5
.
≈≈5 6
Format
≈≈6 <
(
≈≈< =
CultureInfo
∆∆ #
.
∆∆# $
CurrentCulture
∆∆$ 2
,
∆∆2 3
$str
«« }
,
««} ~
	mediaType
»» !
,
»»! "
	formatter
…… !
.
……! "
GetType
……" )
(
……) *
)
……* +
.
……+ ,
Name
……, 0
,
……0 1
type
   
.
   
Name
   !
)
  ! "
)
  " #
;
  # $
}
ÀÀ 
}
ÃÃ 
catch
ÕÕ 
(
ÕÕ 
	Exception
ÕÕ 
e
ÕÕ 
)
ÕÕ 
{
ŒŒ 
sample
œœ 
=
œœ 
new
œœ 
InvalidSample
œœ *
(
œœ* +
String
œœ+ 1
.
œœ1 2
Format
œœ2 8
(
œœ8 9
CultureInfo
–– 
.
––  
CurrentCulture
––  .
,
––. /
$str—— è
,——è ê
	formatter
““ 
.
““ 
GetType
““ %
(
““% &
)
““& '
.
““' (
Name
““( ,
,
““, -
	mediaType
”” 
.
”” 
	MediaType
”” '
,
””' (
UnwrapException
‘‘ #
(
‘‘# $
e
‘‘$ %
)
‘‘% &
.
‘‘& '
Message
‘‘' .
)
‘‘. /
)
‘‘/ 0
;
‘‘0 1
}
’’ 
finally
÷÷ 
{
◊◊ 
if
ÿÿ 
(
ÿÿ 
ms
ÿÿ 
!=
ÿÿ 
null
ÿÿ 
)
ÿÿ 
{
ŸŸ 
ms
⁄⁄ 
.
⁄⁄ 
Dispose
⁄⁄ 
(
⁄⁄ 
)
⁄⁄  
;
⁄⁄  !
}
€€ 
if
‹‹ 
(
‹‹ 
content
‹‹ 
!=
‹‹ 
null
‹‹ #
)
‹‹# $
{
›› 
content
ﬁﬁ 
.
ﬁﬁ 
Dispose
ﬁﬁ #
(
ﬁﬁ# $
)
ﬁﬁ$ %
;
ﬁﬁ% &
}
ﬂﬂ 
}
‡‡ 
return
‚‚ 
sample
‚‚ 
;
‚‚ 
}
„„ 	
internal
ÂÂ 
static
ÂÂ 
	Exception
ÂÂ !
UnwrapException
ÂÂ" 1
(
ÂÂ1 2
	Exception
ÂÂ2 ;
	exception
ÂÂ< E
)
ÂÂE F
{
ÊÊ 	 
AggregateException
ÁÁ  
aggregateException
ÁÁ 1
=
ÁÁ2 3
	exception
ÁÁ4 =
as
ÁÁ> @ 
AggregateException
ÁÁA S
;
ÁÁS T
if
ËË 
(
ËË  
aggregateException
ËË "
!=
ËË# %
null
ËË& *
)
ËË* +
{
ÈÈ 
return
ÍÍ  
aggregateException
ÍÍ )
.
ÍÍ) *
Flatten
ÍÍ* 1
(
ÍÍ1 2
)
ÍÍ2 3
.
ÍÍ3 4
InnerException
ÍÍ4 B
;
ÍÍB C
}
ÎÎ 
return
ÏÏ 
	exception
ÏÏ 
;
ÏÏ 
}
ÌÌ 	
private
 
static
 
object
 (
DefaultSampleObjectFactory
 8
(
8 9%
HelpPageSampleGenerator
9 P
sampleGenerator
Q `
,
` a
Type
b f
type
g k
)
k l
{
ÒÒ 	
ObjectGenerator
ÛÛ 
objectGenerator
ÛÛ +
=
ÛÛ, -
new
ÛÛ. 1
ObjectGenerator
ÛÛ2 A
(
ÛÛA B
)
ÛÛB C
;
ÛÛC D
return
ÙÙ 
objectGenerator
ÙÙ "
.
ÙÙ" #
GenerateObject
ÙÙ# 1
(
ÙÙ1 2
type
ÙÙ2 6
)
ÙÙ6 7
;
ÙÙ7 8
}
ıı 	
[
˜˜ 	
SuppressMessage
˜˜	 
(
˜˜ 
$str
˜˜ +
,
˜˜+ ,
$str
˜˜- U
,
˜˜U V
Justification
˜˜W d
=
˜˜e f
$str˜˜g ü
)˜˜ü †
]˜˜† °
private
¯¯ 
static
¯¯ 
string
¯¯ 
TryFormatJson
¯¯ +
(
¯¯+ ,
string
¯¯, 2
str
¯¯3 6
)
¯¯6 7
{
˘˘ 	
try
˙˙ 
{
˚˚ 
object
¸¸ 

parsedJson
¸¸ !
=
¸¸" #
JsonConvert
¸¸$ /
.
¸¸/ 0
DeserializeObject
¸¸0 A
(
¸¸A B
str
¸¸B E
)
¸¸E F
;
¸¸F G
return
˝˝ 
JsonConvert
˝˝ "
.
˝˝" #
SerializeObject
˝˝# 2
(
˝˝2 3

parsedJson
˝˝3 =
,
˝˝= >

Formatting
˝˝? I
.
˝˝I J
Indented
˝˝J R
)
˝˝R S
;
˝˝S T
}
˛˛ 
catch
ˇˇ 
{
ÄÄ 
return
ÇÇ 
str
ÇÇ 
;
ÇÇ 
}
ÉÉ 
}
ÑÑ 	
[
ÜÜ 	
SuppressMessage
ÜÜ	 
(
ÜÜ 
$str
ÜÜ +
,
ÜÜ+ ,
$str
ÜÜ- U
,
ÜÜU V
Justification
ÜÜW d
=
ÜÜe f
$strÜÜg ü
)ÜÜü †
]ÜÜ† °
private
áá 
static
áá 
string
áá 
TryFormatXml
áá *
(
áá* +
string
áá+ 1
str
áá2 5
)
áá5 6
{
àà 	
try
ââ 
{
ää 
	XDocument
ãã 
xml
ãã 
=
ãã 
	XDocument
ãã  )
.
ãã) *
Parse
ãã* /
(
ãã/ 0
str
ãã0 3
)
ãã3 4
;
ãã4 5
return
åå 
xml
åå 
.
åå 
ToString
åå #
(
åå# $
)
åå$ %
;
åå% &
}
çç 
catch
éé 
{
èè 
return
ëë 
str
ëë 
;
ëë 
}
íí 
}
ìì 	
private
ïï 
static
ïï 
bool
ïï 
IsFormatSupported
ïï -
(
ïï- .
SampleDirection
ïï. =
sampleDirection
ïï> M
,
ïïM N 
MediaTypeFormatter
ïïO a
	formatter
ïïb k
,
ïïk l
Type
ïïm q
type
ïïr v
)
ïïv w
{
ññ 	
switch
óó 
(
óó 
sampleDirection
óó #
)
óó# $
{
òò 
case
ôô 
SampleDirection
ôô $
.
ôô$ %
Request
ôô% ,
:
ôô, -
return
öö 
	formatter
öö $
.
öö$ %
CanReadType
öö% 0
(
öö0 1
type
öö1 5
)
öö5 6
;
öö6 7
case
õõ 
SampleDirection
õõ $
.
õõ$ %
Response
õõ% -
:
õõ- .
return
úú 
	formatter
úú $
.
úú$ %
CanWriteType
úú% 1
(
úú1 2
type
úú2 6
)
úú6 7
;
úú7 8
}
ùù 
return
ûû 
false
ûû 
;
ûû 
}
üü 	
private
°° 
IEnumerable
°° 
<
°° 
KeyValuePair
°° (
<
°°( )
HelpPageSampleKey
°°) :
,
°°: ;
object
°°< B
>
°°B C
>
°°C D!
GetAllActionSamples
°°E X
(
°°X Y
string
°°Y _
controllerName
°°` n
,
°°n o
string
°°p v

actionName°°w Å
,°°Å Ç
IEnumerable°°É é
<°°é è
string°°è ï
>°°ï ñ
parameterNames°°ó •
,°°• ¶
SampleDirection°°ß ∂
sampleDirection°°∑ ∆
)°°∆ «
{
¢¢ 	
HashSet
££ 
<
££ 
string
££ 
>
££ 
parameterNamesSet
££ -
=
££. /
new
££0 3
HashSet
££4 ;
<
££; <
string
££< B
>
££B C
(
££C D
parameterNames
££D R
,
££R S
StringComparer
££T b
.
££b c
OrdinalIgnoreCase
££c t
)
££t u
;
££u v
foreach
§§ 
(
§§ 
var
§§ 
sample
§§ 
in
§§  "
ActionSamples
§§# 0
)
§§0 1
{
•• 
HelpPageSampleKey
¶¶ !
	sampleKey
¶¶" +
=
¶¶, -
sample
¶¶. 4
.
¶¶4 5
Key
¶¶5 8
;
¶¶8 9
if
ßß 
(
ßß 
String
ßß 
.
ßß 
Equals
ßß !
(
ßß! "
controllerName
ßß" 0
,
ßß0 1
	sampleKey
ßß2 ;
.
ßß; <
ControllerName
ßß< J
,
ßßJ K
StringComparison
ßßL \
.
ßß\ ]
OrdinalIgnoreCase
ßß] n
)
ßßn o
&&
ßßp r
String
®® 
.
®® 
Equals
®® !
(
®®! "

actionName
®®" ,
,
®®, -
	sampleKey
®®. 7
.
®®7 8

ActionName
®®8 B
,
®®B C
StringComparison
®®D T
.
®®T U
OrdinalIgnoreCase
®®U f
)
®®f g
&&
®®h j
(
©© 
	sampleKey
©© 
.
©© 
ParameterNames
©© -
.
©©- .
	SetEquals
©©. 7
(
©©7 8
new
©©8 ;
[
©©; <
]
©©< =
{
©©> ?
$str
©©@ C
}
©©D E
)
©©E F
||
©©G I
parameterNamesSet
©©J [
.
©©[ \
	SetEquals
©©\ e
(
©©e f
	sampleKey
©©f o
.
©©o p
ParameterNames
©©p ~
)
©©~ 
)©© Ä
&&©©Å É
sampleDirection
™™ #
==
™™$ &
	sampleKey
™™' 0
.
™™0 1
SampleDirection
™™1 @
)
™™@ A
{
´´ 
yield
¨¨ 
return
¨¨  
sample
¨¨! '
;
¨¨' (
}
≠≠ 
}
ÆÆ 
}
ØØ 	
private
±± 
static
±± 
object
±±  
WrapSampleIfString
±± 0
(
±±0 1
object
±±1 7
sample
±±8 >
)
±±> ?
{
≤≤ 	
string
≥≥ 
stringSample
≥≥ 
=
≥≥  !
sample
≥≥" (
as
≥≥) +
string
≥≥, 2
;
≥≥2 3
if
¥¥ 
(
¥¥ 
stringSample
¥¥ 
!=
¥¥ 
null
¥¥  $
)
¥¥$ %
{
µµ 
return
∂∂ 
new
∂∂ 

TextSample
∂∂ %
(
∂∂% &
stringSample
∂∂& 2
)
∂∂2 3
;
∂∂3 4
}
∑∑ 
return
ππ 
sample
ππ 
;
ππ 
}
∫∫ 	
}
ªª 
}ºº æU
•C:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\SampleGeneration\HelpPageSampleKey.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
{ 
public 

class 
HelpPageSampleKey "
{ 
public 
HelpPageSampleKey  
(  ! 
MediaTypeHeaderValue! 5
	mediaType6 ?
)? @
{ 	
if 
( 
	mediaType 
== 
null !
)! "
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 ;
); <
;< =
} 

ActionName 
= 
String 
.  
Empty  %
;% &
ControllerName 
= 
String #
.# $
Empty$ )
;) *
	MediaType 
= 
	mediaType !
;! "
ParameterNames 
= 
new  
HashSet! (
<( )
string) /
>/ 0
(0 1
StringComparer1 ?
.? @
OrdinalIgnoreCase@ Q
)Q R
;R S
} 	
public## 
HelpPageSampleKey##  
(##  ! 
MediaTypeHeaderValue##! 5
	mediaType##6 ?
,##? @
Type##A E
type##F J
)##J K
:$$ 
this$$ 
($$ 
	mediaType$$ 
)$$ 
{%% 	
if&& 
(&& 
type&& 
==&& 
null&& 
)&& 
{'' 
throw(( 
new(( !
ArgumentNullException(( /
(((/ 0
$str((0 6
)((6 7
;((7 8
})) 
ParameterType++ 
=++ 
type++  
;++  !
},, 	
public55 
HelpPageSampleKey55  
(55  !
SampleDirection55! 0
sampleDirection551 @
,55@ A
string55B H
controllerName55I W
,55W X
string55Y _

actionName55` j
,55j k
IEnumerable55l w
<55w x
string55x ~
>55~ 
parameterNames
55Ä é
)
55é è
{66 	
if77 
(77 
!77 
Enum77 
.77 
	IsDefined77 
(77  
typeof77  &
(77& '
SampleDirection77' 6
)776 7
,777 8
sampleDirection779 H
)77H I
)77I J
{88 
throw99 
new99 (
InvalidEnumArgumentException99 6
(996 7
$str997 H
,99H I
(99J K
int99K N
)99N O
sampleDirection99O ^
,99^ _
typeof99` f
(99f g
SampleDirection99g v
)99v w
)99w x
;99x y
}:: 
if;; 
(;; 
controllerName;; 
==;; !
null;;" &
);;& '
{<< 
throw== 
new== !
ArgumentNullException== /
(==/ 0
$str==0 @
)==@ A
;==A B
}>> 
if?? 
(?? 

actionName?? 
==?? 
null?? "
)??" #
{@@ 
throwAA 
newAA !
ArgumentNullExceptionAA /
(AA/ 0
$strAA0 <
)AA< =
;AA= >
}BB 
ifCC 
(CC 
parameterNamesCC 
==CC !
nullCC" &
)CC& '
{DD 
throwEE 
newEE !
ArgumentNullExceptionEE /
(EE/ 0
$strEE0 @
)EE@ A
;EEA B
}FF 
ControllerNameHH 
=HH 
controllerNameHH +
;HH+ ,

ActionNameII 
=II 

actionNameII #
;II# $
ParameterNamesJJ 
=JJ 
newJJ  
HashSetJJ! (
<JJ( )
stringJJ) /
>JJ/ 0
(JJ0 1
parameterNamesJJ1 ?
,JJ? @
StringComparerJJA O
.JJO P
OrdinalIgnoreCaseJJP a
)JJa b
;JJb c
SampleDirectionKK 
=KK 
sampleDirectionKK -
;KK- .
}LL 	
publicVV 
HelpPageSampleKeyVV  
(VV  ! 
MediaTypeHeaderValueVV! 5
	mediaTypeVV6 ?
,VV? @
SampleDirectionVVA P
sampleDirectionVVQ `
,VV` a
stringVVb h
controllerNameVVi w
,VVw x
stringVVy 

actionName
VVÄ ä
,
VVä ã
IEnumerable
VVå ó
<
VVó ò
string
VVò û
>
VVû ü
parameterNames
VV† Æ
)
VVÆ Ø
:WW 
thisWW 
(WW 
sampleDirectionWW "
,WW" #
controllerNameWW$ 2
,WW2 3

actionNameWW4 >
,WW> ?
parameterNamesWW@ N
)WWN O
{XX 	
ifYY 
(YY 
	mediaTypeYY 
==YY 
nullYY !
)YY! "
{ZZ 
throw[[ 
new[[ !
ArgumentNullException[[ /
([[/ 0
$str[[0 ;
)[[; <
;[[< =
}\\ 
	MediaType^^ 
=^^ 
	mediaType^^ !
;^^! "
}__ 	
publicgg 
stringgg 
ControllerNamegg $
{gg% &
getgg' *
;gg* +
privategg, 3
setgg4 7
;gg7 8
}gg9 :
publicoo 
stringoo 

ActionNameoo  
{oo! "
getoo# &
;oo& '
privateoo( /
setoo0 3
;oo3 4
}oo5 6
publicww  
MediaTypeHeaderValueww #
	MediaTypeww$ -
{ww. /
getww0 3
;ww3 4
privateww5 <
setww= @
;ww@ A
}wwB C
public|| 
HashSet|| 
<|| 
string|| 
>|| 
ParameterNames|| -
{||. /
get||0 3
;||3 4
private||5 <
set||= @
;||@ A
}||B C
public~~ 
Type~~ 
ParameterType~~ !
{~~" #
get~~$ '
;~~' (
private~~) 0
set~~1 4
;~~4 5
}~~6 7
public
ÉÉ 
SampleDirection
ÉÉ 
?
ÉÉ 
SampleDirection
ÉÉ  /
{
ÉÉ0 1
get
ÉÉ2 5
;
ÉÉ5 6
private
ÉÉ7 >
set
ÉÉ? B
;
ÉÉB C
}
ÉÉD E
public
ÖÖ 
override
ÖÖ 
bool
ÖÖ 
Equals
ÖÖ #
(
ÖÖ# $
object
ÖÖ$ *
obj
ÖÖ+ .
)
ÖÖ. /
{
ÜÜ 	
HelpPageSampleKey
áá 
otherKey
áá &
=
áá' (
obj
áá) ,
as
áá- /
HelpPageSampleKey
áá0 A
;
ááA B
if
àà 
(
àà 
otherKey
àà 
==
àà 
null
àà  
)
àà  !
{
ââ 
return
ää 
false
ää 
;
ää 
}
ãã 
return
çç 
String
çç 
.
çç 
Equals
çç  
(
çç  !
ControllerName
çç! /
,
çç/ 0
otherKey
çç1 9
.
çç9 :
ControllerName
çç: H
,
ççH I
StringComparison
ççJ Z
.
ççZ [
OrdinalIgnoreCase
çç[ l
)
ççl m
&&
ççn p
String
éé 
.
éé 
Equals
éé 
(
éé 

ActionName
éé (
,
éé( )
otherKey
éé* 2
.
éé2 3

ActionName
éé3 =
,
éé= >
StringComparison
éé? O
.
ééO P
OrdinalIgnoreCase
ééP a
)
ééa b
&&
ééc e
(
èè 
	MediaType
èè 
==
èè 
otherKey
èè &
.
èè& '
	MediaType
èè' 0
||
èè1 3
(
èè4 5
	MediaType
èè5 >
!=
èè? A
null
èèB F
&&
èèG I
	MediaType
èèJ S
.
èèS T
Equals
èèT Z
(
èèZ [
otherKey
èè[ c
.
èèc d
	MediaType
èèd m
)
èèm n
)
èèn o
)
èèo p
&&
èèq s
ParameterType
êê 
==
êê  
otherKey
êê! )
.
êê) *
ParameterType
êê* 7
&&
êê8 :
SampleDirection
ëë 
==
ëë  "
otherKey
ëë# +
.
ëë+ ,
SampleDirection
ëë, ;
&&
ëë< >
ParameterNames
íí 
.
íí 
	SetEquals
íí (
(
íí( )
otherKey
íí) 1
.
íí1 2
ParameterNames
íí2 @
)
íí@ A
;
ííA B
}
ìì 	
public
ïï 
override
ïï 
int
ïï 
GetHashCode
ïï '
(
ïï' (
)
ïï( )
{
ññ 	
int
óó 
hashCode
óó 
=
óó 
ControllerName
óó )
.
óó) *
ToUpperInvariant
óó* :
(
óó: ;
)
óó; <
.
óó< =
GetHashCode
óó= H
(
óóH I
)
óóI J
^
óóK L

ActionName
óóM W
.
óóW X
ToUpperInvariant
óóX h
(
óóh i
)
óói j
.
óój k
GetHashCode
óók v
(
óóv w
)
óów x
;
óóx y
if
òò 
(
òò 
	MediaType
òò 
!=
òò 
null
òò !
)
òò! "
{
ôô 
hashCode
öö 
^=
öö 
	MediaType
öö %
.
öö% &
GetHashCode
öö& 1
(
öö1 2
)
öö2 3
;
öö3 4
}
õõ 
if
úú 
(
úú 
SampleDirection
úú 
!=
úú  "
null
úú# '
)
úú' (
{
ùù 
hashCode
ûû 
^=
ûû 
SampleDirection
ûû +
.
ûû+ ,
GetHashCode
ûû, 7
(
ûû7 8
)
ûû8 9
;
ûû9 :
}
üü 
if
†† 
(
†† 
ParameterType
†† 
!=
††  
null
††! %
)
††% &
{
°° 
hashCode
¢¢ 
^=
¢¢ 
ParameterType
¢¢ )
.
¢¢) *
GetHashCode
¢¢* 5
(
¢¢5 6
)
¢¢6 7
;
¢¢7 8
}
££ 
foreach
§§ 
(
§§ 
string
§§ 
parameterName
§§ )
in
§§* ,
ParameterNames
§§- ;
)
§§; <
{
•• 
hashCode
¶¶ 
^=
¶¶ 
parameterName
¶¶ )
.
¶¶) *
ToUpperInvariant
¶¶* :
(
¶¶: ;
)
¶¶; <
.
¶¶< =
GetHashCode
¶¶= H
(
¶¶H I
)
¶¶I J
;
¶¶J K
}
ßß 
return
©© 
hashCode
©© 
;
©© 
}
™™ 	
}
´´ 
}¨¨ Õ
üC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\SampleGeneration\ImageSample.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
{ 
public 

class 
ImageSample 
{		 
public 
ImageSample 
( 
string !
src" %
)% &
{ 	
if 
( 
src 
== 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 5
)5 6
;6 7
} 
Src 
= 
src 
; 
} 	
public 
string 
Src 
{ 
get 
;  
private! (
set) ,
;, -
}. /
public 
override 
bool 
Equals #
(# $
object$ *
obj+ .
). /
{ 	
ImageSample 
other 
= 
obj  #
as$ &
ImageSample' 2
;2 3
return 
other 
!= 
null  
&&! #
Src$ '
==( *
other+ 0
.0 1
Src1 4
;4 5
} 	
public 
override 
int 
GetHashCode '
(' (
)( )
{   	
return!! 
Src!! 
.!! 
GetHashCode!! "
(!!" #
)!!# $
;!!$ %
}"" 	
public$$ 
override$$ 
string$$ 
ToString$$ '
($$' (
)$$( )
{%% 	
return&& 
Src&& 
;&& 
}'' 	
}(( 
})) ®
°C:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\SampleGeneration\InvalidSample.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
{ 
public 

class 
InvalidSample 
{		 
public

 
InvalidSample

 
(

 
string

 #
errorMessage

$ 0
)

0 1
{ 	
if 
( 
errorMessage 
== 
null  $
)$ %
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 >
)> ?
;? @
} 
ErrorMessage 
= 
errorMessage '
;' (
} 	
public 
string 
ErrorMessage "
{# $
get% (
;( )
private* 1
set2 5
;5 6
}7 8
public 
override 
bool 
Equals #
(# $
object$ *
obj+ .
). /
{ 	
InvalidSample 
other 
=  !
obj" %
as& (
InvalidSample) 6
;6 7
return 
other 
!= 
null  
&&! #
ErrorMessage$ 0
==1 3
other4 9
.9 :
ErrorMessage: F
;F G
} 	
public 
override 
int 
GetHashCode '
(' (
)( )
{ 	
return 
ErrorMessage 
.  
GetHashCode  +
(+ ,
), -
;- .
} 	
public   
override   
string   
ToString   '
(  ' (
)  ( )
{!! 	
return"" 
ErrorMessage"" 
;""  
}## 	
}$$ 
}%% ≈á
£C:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\SampleGeneration\ObjectGenerator.cs
	namespace		 	
proyectoTEA		
 
.		 
Areas		 
.		 
HelpPage		 $
{

 
public 

class 
ObjectGenerator  
{ 
internal 
const 
int !
DefaultCollectionSize 0
=1 2
$num3 4
;4 5
private 
readonly %
SimpleTypeObjectGenerator 2!
SimpleObjectGenerator3 H
=I J
newK N%
SimpleTypeObjectGeneratorO h
(h i
)i j
;j k
public!! 
object!! 
GenerateObject!! $
(!!$ %
Type!!% )
type!!* .
)!!. /
{"" 	
return## 
GenerateObject## !
(##! "
type##" &
,##& '
new##( +

Dictionary##, 6
<##6 7
Type##7 ;
,##; <
object##= C
>##C D
(##D E
)##E F
)##F G
;##G H
}$$ 	
[&& 	
SuppressMessage&&	 
(&& 
$str&& +
,&&+ ,
$str&&- U
,&&U V
Justification&&W d
=&&e f
$str	&&g °
)
&&° ¢
]
&&¢ £
private'' 
object'' 
GenerateObject'' %
(''% &
Type''& *
type''+ /
,''/ 0

Dictionary''1 ;
<''; <
Type''< @
,''@ A
object''B H
>''H I#
createdObjectReferences''J a
)''a b
{(( 	
try)) 
{** 
if++ 
(++ %
SimpleTypeObjectGenerator++ -
.++- .
CanGenerateObject++. ?
(++? @
type++@ D
)++D E
)++E F
{,, 
return-- !
SimpleObjectGenerator-- 0
.--0 1
GenerateObject--1 ?
(--? @
type--@ D
)--D E
;--E F
}.. 
if00 
(00 
type00 
.00 
IsArray00  
)00  !
{11 
return22 
GenerateArray22 (
(22( )
type22) -
,22- .!
DefaultCollectionSize22/ D
,22D E#
createdObjectReferences22F ]
)22] ^
;22^ _
}33 
if55 
(55 
type55 
.55 
IsGenericType55 &
)55& '
{66 
return77 
GenerateGenericType77 .
(77. /
type77/ 3
,773 4!
DefaultCollectionSize775 J
,77J K#
createdObjectReferences77L c
)77c d
;77d e
}88 
if:: 
(:: 
type:: 
==:: 
typeof:: "
(::" #
IDictionary::# .
)::. /
)::/ 0
{;; 
return<< 
GenerateDictionary<< -
(<<- .
typeof<<. 4
(<<4 5
	Hashtable<<5 >
)<<> ?
,<<? @!
DefaultCollectionSize<<A V
,<<V W#
createdObjectReferences<<X o
)<<o p
;<<p q
}== 
if?? 
(?? 
typeof?? 
(?? 
IDictionary?? &
)??& '
.??' (
IsAssignableFrom??( 8
(??8 9
type??9 =
)??= >
)??> ?
{@@ 
returnAA 
GenerateDictionaryAA -
(AA- .
typeAA. 2
,AA2 3!
DefaultCollectionSizeAA4 I
,AAI J#
createdObjectReferencesAAK b
)AAb c
;AAc d
}BB 
ifDD 
(DD 
typeDD 
==DD 
typeofDD "
(DD" #
IListDD# (
)DD( )
||DD* ,
typeEE 
==EE 
typeofEE "
(EE" #
IEnumerableEE# .
)EE. /
||EE0 2
typeFF 
==FF 
typeofFF "
(FF" #
ICollectionFF# .
)FF. /
)FF/ 0
{GG 
returnHH 
GenerateCollectionHH -
(HH- .
typeofHH. 4
(HH4 5
	ArrayListHH5 >
)HH> ?
,HH? @!
DefaultCollectionSizeHHA V
,HHV W#
createdObjectReferencesHHX o
)HHo p
;HHp q
}II 
ifKK 
(KK 
typeofKK 
(KK 
IListKK  
)KK  !
.KK! "
IsAssignableFromKK" 2
(KK2 3
typeKK3 7
)KK7 8
)KK8 9
{LL 
returnMM 
GenerateCollectionMM -
(MM- .
typeMM. 2
,MM2 3!
DefaultCollectionSizeMM4 I
,MMI J#
createdObjectReferencesMMK b
)MMb c
;MMc d
}NN 
ifPP 
(PP 
typePP 
==PP 
typeofPP "
(PP" #

IQueryablePP# -
)PP- .
)PP. /
{QQ 
returnRR 
GenerateQueryableRR ,
(RR, -
typeRR- 1
,RR1 2!
DefaultCollectionSizeRR3 H
,RRH I#
createdObjectReferencesRRJ a
)RRa b
;RRb c
}SS 
ifUU 
(UU 
typeUU 
.UU 
IsEnumUU 
)UU  
{VV 
returnWW 
GenerateEnumWW '
(WW' (
typeWW( ,
)WW, -
;WW- .
}XX 
ifZZ 
(ZZ 
typeZZ 
.ZZ 
IsPublicZZ !
||ZZ" $
typeZZ% )
.ZZ) *
IsNestedPublicZZ* 8
)ZZ8 9
{[[ 
return\\ !
GenerateComplexObject\\ 0
(\\0 1
type\\1 5
,\\5 6#
createdObjectReferences\\7 N
)\\N O
;\\O P
}]] 
}^^ 
catch__ 
{`` 
returnbb 
nullbb 
;bb 
}cc 
returnee 
nullee 
;ee 
}ff 	
privatehh 
statichh 
objecthh 
GenerateGenericTypehh 1
(hh1 2
Typehh2 6
typehh7 ;
,hh; <
inthh= @
collectionSizehhA O
,hhO P

DictionaryhhQ [
<hh[ \
Typehh\ `
,hh` a
objecthhb h
>hhh i$
createdObjectReferences	hhj Å
)
hhÅ Ç
{ii 	
Typejj !
genericTypeDefinitionjj &
=jj' (
typejj) -
.jj- .$
GetGenericTypeDefinitionjj. F
(jjF G
)jjG H
;jjH I
ifkk 
(kk !
genericTypeDefinitionkk %
==kk& (
typeofkk) /
(kk/ 0
Nullablekk0 8
<kk8 9
>kk9 :
)kk: ;
)kk; <
{ll 
returnmm 
GenerateNullablemm '
(mm' (
typemm( ,
,mm, -#
createdObjectReferencesmm. E
)mmE F
;mmF G
}nn 
ifpp 
(pp !
genericTypeDefinitionpp %
==pp& (
typeofpp) /
(pp/ 0
KeyValuePairpp0 <
<pp< =
,pp= >
>pp> ?
)pp? @
)pp@ A
{qq 
returnrr  
GenerateKeyValuePairrr +
(rr+ ,
typerr, 0
,rr0 1#
createdObjectReferencesrr2 I
)rrI J
;rrJ K
}ss 
ifuu 
(uu 
IsTupleuu 
(uu !
genericTypeDefinitionuu -
)uu- .
)uu. /
{vv 
returnww 
GenerateTupleww $
(ww$ %
typeww% )
,ww) *#
createdObjectReferencesww+ B
)wwB C
;wwC D
}xx 
Typezz 
[zz 
]zz 
genericArgumentszz #
=zz$ %
typezz& *
.zz* +
GetGenericArgumentszz+ >
(zz> ?
)zz? @
;zz@ A
if{{ 
({{ 
genericArguments{{  
.{{  !
Length{{! '
=={{( *
$num{{+ ,
){{, -
{|| 
if}} 
(}} !
genericTypeDefinition}} )
==}}* ,
typeof}}- 3
(}}3 4
IList}}4 9
<}}9 :
>}}: ;
)}}; <
||}}= ?!
genericTypeDefinition~~ )
==~~* ,
typeof~~- 3
(~~3 4
IEnumerable~~4 ?
<~~? @
>~~@ A
)~~A B
||~~C E!
genericTypeDefinition )
==* ,
typeof- 3
(3 4
ICollection4 ?
<? @
>@ A
)A B
)B C
{
ÄÄ 
Type
ÅÅ 
collectionType
ÅÅ '
=
ÅÅ( )
typeof
ÅÅ* 0
(
ÅÅ0 1
List
ÅÅ1 5
<
ÅÅ5 6
>
ÅÅ6 7
)
ÅÅ7 8
.
ÅÅ8 9
MakeGenericType
ÅÅ9 H
(
ÅÅH I
genericArguments
ÅÅI Y
)
ÅÅY Z
;
ÅÅZ [
return
ÇÇ  
GenerateCollection
ÇÇ -
(
ÇÇ- .
collectionType
ÇÇ. <
,
ÇÇ< =
collectionSize
ÇÇ> L
,
ÇÇL M%
createdObjectReferences
ÇÇN e
)
ÇÇe f
;
ÇÇf g
}
ÉÉ 
if
ÖÖ 
(
ÖÖ #
genericTypeDefinition
ÖÖ )
==
ÖÖ* ,
typeof
ÖÖ- 3
(
ÖÖ3 4

IQueryable
ÖÖ4 >
<
ÖÖ> ?
>
ÖÖ? @
)
ÖÖ@ A
)
ÖÖA B
{
ÜÜ 
return
áá 
GenerateQueryable
áá ,
(
áá, -
type
áá- 1
,
áá1 2
collectionSize
áá3 A
,
ááA B%
createdObjectReferences
ááC Z
)
ááZ [
;
áá[ \
}
àà 
Type
ää "
closedCollectionType
ää )
=
ää* +
typeof
ää, 2
(
ää2 3
ICollection
ää3 >
<
ää> ?
>
ää? @
)
ää@ A
.
ääA B
MakeGenericType
ääB Q
(
ääQ R
genericArguments
ääR b
[
ääb c
$num
ääc d
]
ääd e
)
ääe f
;
ääf g
if
ãã 
(
ãã "
closedCollectionType
ãã (
.
ãã( )
IsAssignableFrom
ãã) 9
(
ãã9 :
type
ãã: >
)
ãã> ?
)
ãã? @
{
åå 
return
çç  
GenerateCollection
çç -
(
çç- .
type
çç. 2
,
çç2 3
collectionSize
çç4 B
,
ççB C%
createdObjectReferences
ççD [
)
çç[ \
;
çç\ ]
}
éé 
}
èè 
if
ëë 
(
ëë 
genericArguments
ëë  
.
ëë  !
Length
ëë! '
==
ëë( *
$num
ëë+ ,
)
ëë, -
{
íí 
if
ìì 
(
ìì #
genericTypeDefinition
ìì )
==
ìì* ,
typeof
ìì- 3
(
ìì3 4
IDictionary
ìì4 ?
<
ìì? @
,
ìì@ A
>
ììA B
)
ììB C
)
ììC D
{
îî 
Type
ïï 
dictionaryType
ïï '
=
ïï( )
typeof
ïï* 0
(
ïï0 1

Dictionary
ïï1 ;
<
ïï; <
,
ïï< =
>
ïï= >
)
ïï> ?
.
ïï? @
MakeGenericType
ïï@ O
(
ïïO P
genericArguments
ïïP `
)
ïï` a
;
ïïa b
return
ññ  
GenerateDictionary
ññ -
(
ññ- .
dictionaryType
ññ. <
,
ññ< =
collectionSize
ññ> L
,
ññL M%
createdObjectReferences
ññN e
)
ññe f
;
ññf g
}
óó 
Type
ôô "
closedDictionaryType
ôô )
=
ôô* +
typeof
ôô, 2
(
ôô2 3
IDictionary
ôô3 >
<
ôô> ?
,
ôô? @
>
ôô@ A
)
ôôA B
.
ôôB C
MakeGenericType
ôôC R
(
ôôR S
genericArguments
ôôS c
[
ôôc d
$num
ôôd e
]
ôôe f
,
ôôf g
genericArguments
ôôh x
[
ôôx y
$num
ôôy z
]
ôôz {
)
ôô{ |
;
ôô| }
if
öö 
(
öö "
closedDictionaryType
öö (
.
öö( )
IsAssignableFrom
öö) 9
(
öö9 :
type
öö: >
)
öö> ?
)
öö? @
{
õõ 
return
úú  
GenerateDictionary
úú -
(
úú- .
type
úú. 2
,
úú2 3
collectionSize
úú4 B
,
úúB C%
createdObjectReferences
úúD [
)
úú[ \
;
úú\ ]
}
ùù 
}
ûû 
if
†† 
(
†† 
type
†† 
.
†† 
IsPublic
†† 
||
††  
type
††! %
.
††% &
IsNestedPublic
††& 4
)
††4 5
{
°° 
return
¢¢ #
GenerateComplexObject
¢¢ ,
(
¢¢, -
type
¢¢- 1
,
¢¢1 2%
createdObjectReferences
¢¢3 J
)
¢¢J K
;
¢¢K L
}
££ 
return
•• 
null
•• 
;
•• 
}
¶¶ 	
private
®® 
static
®® 
object
®® 
GenerateTuple
®® +
(
®®+ ,
Type
®®, 0
type
®®1 5
,
®®5 6

Dictionary
®®7 A
<
®®A B
Type
®®B F
,
®®F G
object
®®H N
>
®®N O%
createdObjectReferences
®®P g
)
®®g h
{
©© 	
Type
™™ 
[
™™ 
]
™™ 
genericArgs
™™ 
=
™™  
type
™™! %
.
™™% &!
GetGenericArguments
™™& 9
(
™™9 :
)
™™: ;
;
™™; <
object
´´ 
[
´´ 
]
´´ 
parameterValues
´´ $
=
´´% &
new
´´' *
object
´´+ 1
[
´´1 2
genericArgs
´´2 =
.
´´= >
Length
´´> D
]
´´D E
;
´´E F
bool
¨¨ !
failedToCreateTuple
¨¨ $
=
¨¨% &
true
¨¨' +
;
¨¨+ ,
ObjectGenerator
≠≠ 
objectGenerator
≠≠ +
=
≠≠, -
new
≠≠. 1
ObjectGenerator
≠≠2 A
(
≠≠A B
)
≠≠B C
;
≠≠C D
for
ÆÆ 
(
ÆÆ 
int
ÆÆ 
i
ÆÆ 
=
ÆÆ 
$num
ÆÆ 
;
ÆÆ 
i
ÆÆ 
<
ÆÆ 
genericArgs
ÆÆ  +
.
ÆÆ+ ,
Length
ÆÆ, 2
;
ÆÆ2 3
i
ÆÆ4 5
++
ÆÆ5 7
)
ÆÆ7 8
{
ØØ 
parameterValues
∞∞ 
[
∞∞  
i
∞∞  !
]
∞∞! "
=
∞∞# $
objectGenerator
∞∞% 4
.
∞∞4 5
GenerateObject
∞∞5 C
(
∞∞C D
genericArgs
∞∞D O
[
∞∞O P
i
∞∞P Q
]
∞∞Q R
,
∞∞R S%
createdObjectReferences
∞∞T k
)
∞∞k l
;
∞∞l m!
failedToCreateTuple
±± #
&=
±±$ &
parameterValues
±±' 6
[
±±6 7
i
±±7 8
]
±±8 9
==
±±: <
null
±±= A
;
±±A B
}
≤≤ 
if
≥≥ 
(
≥≥ !
failedToCreateTuple
≥≥ #
)
≥≥# $
{
¥¥ 
return
µµ 
null
µµ 
;
µµ 
}
∂∂ 
object
∑∑ 
result
∑∑ 
=
∑∑ 
	Activator
∑∑ %
.
∑∑% &
CreateInstance
∑∑& 4
(
∑∑4 5
type
∑∑5 9
,
∑∑9 :
parameterValues
∑∑; J
)
∑∑J K
;
∑∑K L
return
∏∏ 
result
∏∏ 
;
∏∏ 
}
ππ 	
private
ªª 
static
ªª 
bool
ªª 
IsTuple
ªª #
(
ªª# $
Type
ªª$ (#
genericTypeDefinition
ªª) >
)
ªª> ?
{
ºº 	
return
ΩΩ #
genericTypeDefinition
ΩΩ (
==
ΩΩ) +
typeof
ΩΩ, 2
(
ΩΩ2 3
Tuple
ΩΩ3 8
<
ΩΩ8 9
>
ΩΩ9 :
)
ΩΩ: ;
||
ΩΩ< >#
genericTypeDefinition
ææ %
==
ææ& (
typeof
ææ) /
(
ææ/ 0
Tuple
ææ0 5
<
ææ5 6
,
ææ6 7
>
ææ7 8
)
ææ8 9
||
ææ: <#
genericTypeDefinition
øø %
==
øø& (
typeof
øø) /
(
øø/ 0
Tuple
øø0 5
<
øø5 6
,
øø6 7
,
øø7 8
>
øø8 9
)
øø9 :
||
øø; =#
genericTypeDefinition
¿¿ %
==
¿¿& (
typeof
¿¿) /
(
¿¿/ 0
Tuple
¿¿0 5
<
¿¿5 6
,
¿¿6 7
,
¿¿7 8
,
¿¿8 9
>
¿¿9 :
)
¿¿: ;
||
¿¿< >#
genericTypeDefinition
¡¡ %
==
¡¡& (
typeof
¡¡) /
(
¡¡/ 0
Tuple
¡¡0 5
<
¡¡5 6
,
¡¡6 7
,
¡¡7 8
,
¡¡8 9
,
¡¡9 :
>
¡¡: ;
)
¡¡; <
||
¡¡= ?#
genericTypeDefinition
¬¬ %
==
¬¬& (
typeof
¬¬) /
(
¬¬/ 0
Tuple
¬¬0 5
<
¬¬5 6
,
¬¬6 7
,
¬¬7 8
,
¬¬8 9
,
¬¬9 :
,
¬¬: ;
>
¬¬; <
)
¬¬< =
||
¬¬> @#
genericTypeDefinition
√√ %
==
√√& (
typeof
√√) /
(
√√/ 0
Tuple
√√0 5
<
√√5 6
,
√√6 7
,
√√7 8
,
√√8 9
,
√√9 :
,
√√: ;
,
√√; <
>
√√< =
)
√√= >
||
√√? A#
genericTypeDefinition
ƒƒ %
==
ƒƒ& (
typeof
ƒƒ) /
(
ƒƒ/ 0
Tuple
ƒƒ0 5
<
ƒƒ5 6
,
ƒƒ6 7
,
ƒƒ7 8
,
ƒƒ8 9
,
ƒƒ9 :
,
ƒƒ: ;
,
ƒƒ; <
,
ƒƒ< =
>
ƒƒ= >
)
ƒƒ> ?
;
ƒƒ? @
}
≈≈ 	
private
«« 
static
«« 
object
«« "
GenerateKeyValuePair
«« 2
(
««2 3
Type
««3 7
keyValuePairType
««8 H
,
««H I

Dictionary
««J T
<
««T U
Type
««U Y
,
««Y Z
object
««[ a
>
««a b%
createdObjectReferences
««c z
)
««z {
{
»» 	
Type
…… 
[
…… 
]
…… 
genericArgs
…… 
=
……  
keyValuePairType
……! 1
.
……1 2!
GetGenericArguments
……2 E
(
……E F
)
……F G
;
……G H
Type
   
typeK
   
=
   
genericArgs
   $
[
  $ %
$num
  % &
]
  & '
;
  ' (
Type
ÀÀ 
typeV
ÀÀ 
=
ÀÀ 
genericArgs
ÀÀ $
[
ÀÀ$ %
$num
ÀÀ% &
]
ÀÀ& '
;
ÀÀ' (
ObjectGenerator
ÃÃ 
objectGenerator
ÃÃ +
=
ÃÃ, -
new
ÃÃ. 1
ObjectGenerator
ÃÃ2 A
(
ÃÃA B
)
ÃÃB C
;
ÃÃC D
object
ÕÕ 
	keyObject
ÕÕ 
=
ÕÕ 
objectGenerator
ÕÕ .
.
ÕÕ. /
GenerateObject
ÕÕ/ =
(
ÕÕ= >
typeK
ÕÕ> C
,
ÕÕC D%
createdObjectReferences
ÕÕE \
)
ÕÕ\ ]
;
ÕÕ] ^
object
ŒŒ 
valueObject
ŒŒ 
=
ŒŒ  
objectGenerator
ŒŒ! 0
.
ŒŒ0 1
GenerateObject
ŒŒ1 ?
(
ŒŒ? @
typeV
ŒŒ@ E
,
ŒŒE F%
createdObjectReferences
ŒŒG ^
)
ŒŒ^ _
;
ŒŒ_ `
if
œœ 
(
œœ 
	keyObject
œœ 
==
œœ 
null
œœ !
&&
œœ" $
valueObject
œœ% 0
==
œœ1 3
null
œœ4 8
)
œœ8 9
{
–– 
return
““ 
null
““ 
;
““ 
}
”” 
object
‘‘ 
result
‘‘ 
=
‘‘ 
	Activator
‘‘ %
.
‘‘% &
CreateInstance
‘‘& 4
(
‘‘4 5
keyValuePairType
‘‘5 E
,
‘‘E F
	keyObject
‘‘G P
,
‘‘P Q
valueObject
‘‘R ]
)
‘‘] ^
;
‘‘^ _
return
’’ 
result
’’ 
;
’’ 
}
÷÷ 	
private
ÿÿ 
static
ÿÿ 
object
ÿÿ 
GenerateArray
ÿÿ +
(
ÿÿ+ ,
Type
ÿÿ, 0
	arrayType
ÿÿ1 :
,
ÿÿ: ;
int
ÿÿ< ?
size
ÿÿ@ D
,
ÿÿD E

Dictionary
ÿÿF P
<
ÿÿP Q
Type
ÿÿQ U
,
ÿÿU V
object
ÿÿW ]
>
ÿÿ] ^%
createdObjectReferences
ÿÿ_ v
)
ÿÿv w
{
ŸŸ 	
Type
⁄⁄ 
type
⁄⁄ 
=
⁄⁄ 
	arrayType
⁄⁄ !
.
⁄⁄! "
GetElementType
⁄⁄" 0
(
⁄⁄0 1
)
⁄⁄1 2
;
⁄⁄2 3
Array
€€ 
result
€€ 
=
€€ 
Array
€€  
.
€€  !
CreateInstance
€€! /
(
€€/ 0
type
€€0 4
,
€€4 5
size
€€6 :
)
€€: ;
;
€€; <
bool
‹‹  
areAllElementsNull
‹‹ #
=
‹‹$ %
true
‹‹& *
;
‹‹* +
ObjectGenerator
›› 
objectGenerator
›› +
=
››, -
new
››. 1
ObjectGenerator
››2 A
(
››A B
)
››B C
;
››C D
for
ﬁﬁ 
(
ﬁﬁ 
int
ﬁﬁ 
i
ﬁﬁ 
=
ﬁﬁ 
$num
ﬁﬁ 
;
ﬁﬁ 
i
ﬁﬁ 
<
ﬁﬁ 
size
ﬁﬁ  $
;
ﬁﬁ$ %
i
ﬁﬁ& '
++
ﬁﬁ' )
)
ﬁﬁ) *
{
ﬂﬂ 
object
‡‡ 
element
‡‡ 
=
‡‡  
objectGenerator
‡‡! 0
.
‡‡0 1
GenerateObject
‡‡1 ?
(
‡‡? @
type
‡‡@ D
,
‡‡D E%
createdObjectReferences
‡‡F ]
)
‡‡] ^
;
‡‡^ _
result
·· 
.
·· 
SetValue
·· 
(
··  
element
··  '
,
··' (
i
··) *
)
··* +
;
··+ , 
areAllElementsNull
‚‚ "
&=
‚‚# %
element
‚‚& -
==
‚‚. 0
null
‚‚1 5
;
‚‚5 6
}
„„ 
if
ÂÂ 
(
ÂÂ  
areAllElementsNull
ÂÂ "
)
ÂÂ" #
{
ÊÊ 
return
ÁÁ 
null
ÁÁ 
;
ÁÁ 
}
ËË 
return
ÍÍ 
result
ÍÍ 
;
ÍÍ 
}
ÎÎ 	
private
ÌÌ 
static
ÌÌ 
object
ÌÌ  
GenerateDictionary
ÌÌ 0
(
ÌÌ0 1
Type
ÌÌ1 5
dictionaryType
ÌÌ6 D
,
ÌÌD E
int
ÌÌF I
size
ÌÌJ N
,
ÌÌN O

Dictionary
ÌÌP Z
<
ÌÌZ [
Type
ÌÌ[ _
,
ÌÌ_ `
object
ÌÌa g
>
ÌÌg h&
createdObjectReferencesÌÌi Ä
)ÌÌÄ Å
{
ÓÓ 	
Type
ÔÔ 
typeK
ÔÔ 
=
ÔÔ 
typeof
ÔÔ 
(
ÔÔ  
object
ÔÔ  &
)
ÔÔ& '
;
ÔÔ' (
Type
 
typeV
 
=
 
typeof
 
(
  
object
  &
)
& '
;
' (
if
ÒÒ 
(
ÒÒ 
dictionaryType
ÒÒ 
.
ÒÒ 
IsGenericType
ÒÒ ,
)
ÒÒ, -
{
ÚÚ 
Type
ÛÛ 
[
ÛÛ 
]
ÛÛ 
genericArgs
ÛÛ "
=
ÛÛ# $
dictionaryType
ÛÛ% 3
.
ÛÛ3 4!
GetGenericArguments
ÛÛ4 G
(
ÛÛG H
)
ÛÛH I
;
ÛÛI J
typeK
ÙÙ 
=
ÙÙ 
genericArgs
ÙÙ #
[
ÙÙ# $
$num
ÙÙ$ %
]
ÙÙ% &
;
ÙÙ& '
typeV
ıı 
=
ıı 
genericArgs
ıı #
[
ıı# $
$num
ıı$ %
]
ıı% &
;
ıı& '
}
ˆˆ 
object
¯¯ 
result
¯¯ 
=
¯¯ 
	Activator
¯¯ %
.
¯¯% &
CreateInstance
¯¯& 4
(
¯¯4 5
dictionaryType
¯¯5 C
)
¯¯C D
;
¯¯D E

MethodInfo
˘˘ 
	addMethod
˘˘  
=
˘˘! "
dictionaryType
˘˘# 1
.
˘˘1 2
	GetMethod
˘˘2 ;
(
˘˘; <
$str
˘˘< A
)
˘˘A B
??
˘˘C E
dictionaryType
˘˘F T
.
˘˘T U
	GetMethod
˘˘U ^
(
˘˘^ _
$str
˘˘_ g
)
˘˘g h
;
˘˘h i

MethodInfo
˙˙ 
containsMethod
˙˙ %
=
˙˙& '
dictionaryType
˙˙( 6
.
˙˙6 7
	GetMethod
˙˙7 @
(
˙˙@ A
$str
˙˙A K
)
˙˙K L
??
˙˙M O
dictionaryType
˙˙P ^
.
˙˙^ _
	GetMethod
˙˙_ h
(
˙˙h i
$str
˙˙i v
)
˙˙v w
;
˙˙w x
ObjectGenerator
˚˚ 
objectGenerator
˚˚ +
=
˚˚, -
new
˚˚. 1
ObjectGenerator
˚˚2 A
(
˚˚A B
)
˚˚B C
;
˚˚C D
for
¸¸ 
(
¸¸ 
int
¸¸ 
i
¸¸ 
=
¸¸ 
$num
¸¸ 
;
¸¸ 
i
¸¸ 
<
¸¸ 
size
¸¸  $
;
¸¸$ %
i
¸¸& '
++
¸¸' )
)
¸¸) *
{
˝˝ 
object
˛˛ 
newKey
˛˛ 
=
˛˛ 
objectGenerator
˛˛  /
.
˛˛/ 0
GenerateObject
˛˛0 >
(
˛˛> ?
typeK
˛˛? D
,
˛˛D E%
createdObjectReferences
˛˛F ]
)
˛˛] ^
;
˛˛^ _
if
ˇˇ 
(
ˇˇ 
newKey
ˇˇ 
==
ˇˇ 
null
ˇˇ "
)
ˇˇ" #
{
ÄÄ 
return
ÇÇ 
null
ÇÇ 
;
ÇÇ  
}
ÉÉ 
bool
ÖÖ 
containsKey
ÖÖ  
=
ÖÖ! "
(
ÖÖ# $
bool
ÖÖ$ (
)
ÖÖ( )
containsMethod
ÖÖ) 7
.
ÖÖ7 8
Invoke
ÖÖ8 >
(
ÖÖ> ?
result
ÖÖ? E
,
ÖÖE F
new
ÖÖG J
object
ÖÖK Q
[
ÖÖQ R
]
ÖÖR S
{
ÖÖT U
newKey
ÖÖV \
}
ÖÖ] ^
)
ÖÖ^ _
;
ÖÖ_ `
if
ÜÜ 
(
ÜÜ 
!
ÜÜ 
containsKey
ÜÜ  
)
ÜÜ  !
{
áá 
object
àà 
newValue
àà #
=
àà$ %
objectGenerator
àà& 5
.
àà5 6
GenerateObject
àà6 D
(
ààD E
typeV
ààE J
,
ààJ K%
createdObjectReferences
ààL c
)
ààc d
;
ààd e
	addMethod
ââ 
.
ââ 
Invoke
ââ $
(
ââ$ %
result
ââ% +
,
ââ+ ,
new
ââ- 0
object
ââ1 7
[
ââ7 8
]
ââ8 9
{
ââ: ;
newKey
ââ< B
,
ââB C
newValue
ââD L
}
ââM N
)
ââN O
;
ââO P
}
ää 
}
ãã 
return
çç 
result
çç 
;
çç 
}
éé 	
private
êê 
static
êê 
object
êê 
GenerateEnum
êê *
(
êê* +
Type
êê+ /
enumType
êê0 8
)
êê8 9
{
ëë 	
Array
íí 
possibleValues
íí  
=
íí! "
Enum
íí# '
.
íí' (
	GetValues
íí( 1
(
íí1 2
enumType
íí2 :
)
íí: ;
;
íí; <
if
ìì 
(
ìì 
possibleValues
ìì 
.
ìì 
Length
ìì %
>
ìì& '
$num
ìì( )
)
ìì) *
{
îî 
return
ïï 
possibleValues
ïï %
.
ïï% &
GetValue
ïï& .
(
ïï. /
$num
ïï/ 0
)
ïï0 1
;
ïï1 2
}
ññ 
return
óó 
null
óó 
;
óó 
}
òò 	
private
öö 
static
öö 
object
öö 
GenerateQueryable
öö /
(
öö/ 0
Type
öö0 4
queryableType
öö5 B
,
ööB C
int
ööD G
size
ööH L
,
ööL M

Dictionary
ööN X
<
ööX Y
Type
ööY ]
,
öö] ^
object
öö_ e
>
ööe f%
createdObjectReferences
öög ~
)
öö~ 
{
õõ 	
bool
úú 
	isGeneric
úú 
=
úú 
queryableType
úú *
.
úú* +
IsGenericType
úú+ 8
;
úú8 9
object
ùù 
list
ùù 
;
ùù 
if
ûû 
(
ûû 
	isGeneric
ûû 
)
ûû 
{
üü 
Type
†† 
listType
†† 
=
†† 
typeof
††  &
(
††& '
List
††' +
<
††+ ,
>
††, -
)
††- .
.
††. /
MakeGenericType
††/ >
(
††> ?
queryableType
††? L
.
††L M!
GetGenericArguments
††M `
(
††` a
)
††a b
)
††b c
;
††c d
list
°° 
=
°°  
GenerateCollection
°° )
(
°°) *
listType
°°* 2
,
°°2 3
size
°°4 8
,
°°8 9%
createdObjectReferences
°°: Q
)
°°Q R
;
°°R S
}
¢¢ 
else
££ 
{
§§ 
list
•• 
=
•• 
GenerateArray
•• $
(
••$ %
typeof
••% +
(
••+ ,
object
••, 2
[
••2 3
]
••3 4
)
••4 5
,
••5 6
size
••7 ;
,
••; <%
createdObjectReferences
••= T
)
••T U
;
••U V
}
¶¶ 
if
ßß 
(
ßß 
list
ßß 
==
ßß 
null
ßß 
)
ßß 
{
®® 
return
©© 
null
©© 
;
©© 
}
™™ 
if
´´ 
(
´´ 
	isGeneric
´´ 
)
´´ 
{
¨¨ 
Type
≠≠ 
argumentType
≠≠ !
=
≠≠" #
typeof
≠≠$ *
(
≠≠* +
IEnumerable
≠≠+ 6
<
≠≠6 7
>
≠≠7 8
)
≠≠8 9
.
≠≠9 :
MakeGenericType
≠≠: I
(
≠≠I J
queryableType
≠≠J W
.
≠≠W X!
GetGenericArguments
≠≠X k
(
≠≠k l
)
≠≠l m
)
≠≠m n
;
≠≠n o

MethodInfo
ÆÆ 
asQueryableMethod
ÆÆ ,
=
ÆÆ- .
typeof
ÆÆ/ 5
(
ÆÆ5 6
	Queryable
ÆÆ6 ?
)
ÆÆ? @
.
ÆÆ@ A
	GetMethod
ÆÆA J
(
ÆÆJ K
$str
ÆÆK X
,
ÆÆX Y
new
ÆÆZ ]
[
ÆÆ] ^
]
ÆÆ^ _
{
ÆÆ` a
argumentType
ÆÆb n
}
ÆÆo p
)
ÆÆp q
;
ÆÆq r
return
ØØ 
asQueryableMethod
ØØ (
.
ØØ( )
Invoke
ØØ) /
(
ØØ/ 0
null
ØØ0 4
,
ØØ4 5
new
ØØ6 9
[
ØØ9 :
]
ØØ: ;
{
ØØ< =
list
ØØ> B
}
ØØC D
)
ØØD E
;
ØØE F
}
∞∞ 
return
≤≤ 
	Queryable
≤≤ 
.
≤≤ 
AsQueryable
≤≤ (
(
≤≤( )
(
≤≤) *
IEnumerable
≤≤* 5
)
≤≤5 6
list
≤≤6 :
)
≤≤: ;
;
≤≤; <
}
≥≥ 	
private
µµ 
static
µµ 
object
µµ  
GenerateCollection
µµ 0
(
µµ0 1
Type
µµ1 5
collectionType
µµ6 D
,
µµD E
int
µµF I
size
µµJ N
,
µµN O

Dictionary
µµP Z
<
µµZ [
Type
µµ[ _
,
µµ_ `
object
µµa g
>
µµg h&
createdObjectReferencesµµi Ä
)µµÄ Å
{
∂∂ 	
Type
∑∑ 
type
∑∑ 
=
∑∑ 
collectionType
∑∑ &
.
∑∑& '
IsGenericType
∑∑' 4
?
∑∑5 6
collectionType
∏∏ 
.
∏∏ !
GetGenericArguments
∏∏ 2
(
∏∏2 3
)
∏∏3 4
[
∏∏4 5
$num
∏∏5 6
]
∏∏6 7
:
∏∏8 9
typeof
ππ 
(
ππ 
object
ππ 
)
ππ 
;
ππ 
object
∫∫ 
result
∫∫ 
=
∫∫ 
	Activator
∫∫ %
.
∫∫% &
CreateInstance
∫∫& 4
(
∫∫4 5
collectionType
∫∫5 C
)
∫∫C D
;
∫∫D E

MethodInfo
ªª 
	addMethod
ªª  
=
ªª! "
collectionType
ªª# 1
.
ªª1 2
	GetMethod
ªª2 ;
(
ªª; <
$str
ªª< A
)
ªªA B
;
ªªB C
bool
ºº  
areAllElementsNull
ºº #
=
ºº$ %
true
ºº& *
;
ºº* +
ObjectGenerator
ΩΩ 
objectGenerator
ΩΩ +
=
ΩΩ, -
new
ΩΩ. 1
ObjectGenerator
ΩΩ2 A
(
ΩΩA B
)
ΩΩB C
;
ΩΩC D
for
ææ 
(
ææ 
int
ææ 
i
ææ 
=
ææ 
$num
ææ 
;
ææ 
i
ææ 
<
ææ 
size
ææ  $
;
ææ$ %
i
ææ& '
++
ææ' )
)
ææ) *
{
øø 
object
¿¿ 
element
¿¿ 
=
¿¿  
objectGenerator
¿¿! 0
.
¿¿0 1
GenerateObject
¿¿1 ?
(
¿¿? @
type
¿¿@ D
,
¿¿D E%
createdObjectReferences
¿¿F ]
)
¿¿] ^
;
¿¿^ _
	addMethod
¡¡ 
.
¡¡ 
Invoke
¡¡  
(
¡¡  !
result
¡¡! '
,
¡¡' (
new
¡¡) ,
object
¡¡- 3
[
¡¡3 4
]
¡¡4 5
{
¡¡6 7
element
¡¡8 ?
}
¡¡@ A
)
¡¡A B
;
¡¡B C 
areAllElementsNull
¬¬ "
&=
¬¬# %
element
¬¬& -
==
¬¬. 0
null
¬¬1 5
;
¬¬5 6
}
√√ 
if
≈≈ 
(
≈≈  
areAllElementsNull
≈≈ "
)
≈≈" #
{
∆∆ 
return
«« 
null
«« 
;
«« 
}
»» 
return
   
result
   
;
   
}
ÀÀ 	
private
ÕÕ 
static
ÕÕ 
object
ÕÕ 
GenerateNullable
ÕÕ .
(
ÕÕ. /
Type
ÕÕ/ 3
nullableType
ÕÕ4 @
,
ÕÕ@ A

Dictionary
ÕÕB L
<
ÕÕL M
Type
ÕÕM Q
,
ÕÕQ R
object
ÕÕS Y
>
ÕÕY Z%
createdObjectReferences
ÕÕ[ r
)
ÕÕr s
{
ŒŒ 	
Type
œœ 
type
œœ 
=
œœ 
nullableType
œœ $
.
œœ$ %!
GetGenericArguments
œœ% 8
(
œœ8 9
)
œœ9 :
[
œœ: ;
$num
œœ; <
]
œœ< =
;
œœ= >
ObjectGenerator
–– 
objectGenerator
–– +
=
––, -
new
––. 1
ObjectGenerator
––2 A
(
––A B
)
––B C
;
––C D
return
—— 
objectGenerator
—— "
.
——" #
GenerateObject
——# 1
(
——1 2
type
——2 6
,
——6 7%
createdObjectReferences
——8 O
)
——O P
;
——P Q
}
““ 	
private
‘‘ 
static
‘‘ 
object
‘‘ #
GenerateComplexObject
‘‘ 3
(
‘‘3 4
Type
‘‘4 8
type
‘‘9 =
,
‘‘= >

Dictionary
‘‘? I
<
‘‘I J
Type
‘‘J N
,
‘‘N O
object
‘‘P V
>
‘‘V W%
createdObjectReferences
‘‘X o
)
‘‘o p
{
’’ 	
object
÷÷ 
result
÷÷ 
=
÷÷ 
null
÷÷  
;
÷÷  !
if
ÿÿ 
(
ÿÿ %
createdObjectReferences
ÿÿ '
.
ÿÿ' (
TryGetValue
ÿÿ( 3
(
ÿÿ3 4
type
ÿÿ4 8
,
ÿÿ8 9
out
ÿÿ: =
result
ÿÿ> D
)
ÿÿD E
)
ÿÿE F
{
ŸŸ 
return
€€ 
result
€€ 
;
€€ 
}
‹‹ 
if
ﬁﬁ 
(
ﬁﬁ 
type
ﬁﬁ 
.
ﬁﬁ 
IsValueType
ﬁﬁ  
)
ﬁﬁ  !
{
ﬂﬂ 
result
‡‡ 
=
‡‡ 
	Activator
‡‡ "
.
‡‡" #
CreateInstance
‡‡# 1
(
‡‡1 2
type
‡‡2 6
)
‡‡6 7
;
‡‡7 8
}
·· 
else
‚‚ 
{
„„ 
ConstructorInfo
‰‰ 
defaultCtor
‰‰  +
=
‰‰, -
type
‰‰. 2
.
‰‰2 3
GetConstructor
‰‰3 A
(
‰‰A B
Type
‰‰B F
.
‰‰F G

EmptyTypes
‰‰G Q
)
‰‰Q R
;
‰‰R S
if
ÂÂ 
(
ÂÂ 
defaultCtor
ÂÂ 
==
ÂÂ  "
null
ÂÂ# '
)
ÂÂ' (
{
ÊÊ 
return
ËË 
null
ËË 
;
ËË  
}
ÈÈ 
result
ÎÎ 
=
ÎÎ 
defaultCtor
ÎÎ $
.
ÎÎ$ %
Invoke
ÎÎ% +
(
ÎÎ+ ,
new
ÎÎ, /
object
ÎÎ0 6
[
ÎÎ6 7
$num
ÎÎ7 8
]
ÎÎ8 9
)
ÎÎ9 :
;
ÎÎ: ;
}
ÏÏ %
createdObjectReferences
ÌÌ #
.
ÌÌ# $
Add
ÌÌ$ '
(
ÌÌ' (
type
ÌÌ( ,
,
ÌÌ, -
result
ÌÌ. 4
)
ÌÌ4 5
;
ÌÌ5 6!
SetPublicProperties
ÓÓ 
(
ÓÓ  
type
ÓÓ  $
,
ÓÓ$ %
result
ÓÓ& ,
,
ÓÓ, -%
createdObjectReferences
ÓÓ. E
)
ÓÓE F
;
ÓÓF G
SetPublicFields
ÔÔ 
(
ÔÔ 
type
ÔÔ  
,
ÔÔ  !
result
ÔÔ" (
,
ÔÔ( )%
createdObjectReferences
ÔÔ* A
)
ÔÔA B
;
ÔÔB C
return
 
result
 
;
 
}
ÒÒ 	
private
ÛÛ 
static
ÛÛ 
void
ÛÛ !
SetPublicProperties
ÛÛ /
(
ÛÛ/ 0
Type
ÛÛ0 4
type
ÛÛ5 9
,
ÛÛ9 :
object
ÛÛ; A
obj
ÛÛB E
,
ÛÛE F

Dictionary
ÛÛG Q
<
ÛÛQ R
Type
ÛÛR V
,
ÛÛV W
object
ÛÛX ^
>
ÛÛ^ _%
createdObjectReferences
ÛÛ` w
)
ÛÛw x
{
ÙÙ 	
PropertyInfo
ıı 
[
ıı 
]
ıı 

properties
ıı %
=
ıı& '
type
ıı( ,
.
ıı, -
GetProperties
ıı- :
(
ıı: ;
BindingFlags
ıı; G
.
ııG H
Public
ııH N
|
ııO P
BindingFlags
ııQ ]
.
ıı] ^
Instance
ıı^ f
)
ııf g
;
ııg h
ObjectGenerator
ˆˆ 
objectGenerator
ˆˆ +
=
ˆˆ, -
new
ˆˆ. 1
ObjectGenerator
ˆˆ2 A
(
ˆˆA B
)
ˆˆB C
;
ˆˆC D
foreach
˜˜ 
(
˜˜ 
PropertyInfo
˜˜ !
property
˜˜" *
in
˜˜+ -

properties
˜˜. 8
)
˜˜8 9
{
¯¯ 
if
˘˘ 
(
˘˘ 
property
˘˘ 
.
˘˘ 
CanWrite
˘˘ %
)
˘˘% &
{
˙˙ 
object
˚˚ 
propertyValue
˚˚ (
=
˚˚) *
objectGenerator
˚˚+ :
.
˚˚: ;
GenerateObject
˚˚; I
(
˚˚I J
property
˚˚J R
.
˚˚R S
PropertyType
˚˚S _
,
˚˚_ `%
createdObjectReferences
˚˚a x
)
˚˚x y
;
˚˚y z
property
¸¸ 
.
¸¸ 
SetValue
¸¸ %
(
¸¸% &
obj
¸¸& )
,
¸¸) *
propertyValue
¸¸+ 8
,
¸¸8 9
null
¸¸: >
)
¸¸> ?
;
¸¸? @
}
˝˝ 
}
˛˛ 
}
ˇˇ 	
private
ÅÅ 
static
ÅÅ 
void
ÅÅ 
SetPublicFields
ÅÅ +
(
ÅÅ+ ,
Type
ÅÅ, 0
type
ÅÅ1 5
,
ÅÅ5 6
object
ÅÅ7 =
obj
ÅÅ> A
,
ÅÅA B

Dictionary
ÅÅC M
<
ÅÅM N
Type
ÅÅN R
,
ÅÅR S
object
ÅÅT Z
>
ÅÅZ [%
createdObjectReferences
ÅÅ\ s
)
ÅÅs t
{
ÇÇ 	
	FieldInfo
ÉÉ 
[
ÉÉ 
]
ÉÉ 
fields
ÉÉ 
=
ÉÉ  
type
ÉÉ! %
.
ÉÉ% &
	GetFields
ÉÉ& /
(
ÉÉ/ 0
BindingFlags
ÉÉ0 <
.
ÉÉ< =
Public
ÉÉ= C
|
ÉÉD E
BindingFlags
ÉÉF R
.
ÉÉR S
Instance
ÉÉS [
)
ÉÉ[ \
;
ÉÉ\ ]
ObjectGenerator
ÑÑ 
objectGenerator
ÑÑ +
=
ÑÑ, -
new
ÑÑ. 1
ObjectGenerator
ÑÑ2 A
(
ÑÑA B
)
ÑÑB C
;
ÑÑC D
foreach
ÖÖ 
(
ÖÖ 
	FieldInfo
ÖÖ 
field
ÖÖ $
in
ÖÖ% '
fields
ÖÖ( .
)
ÖÖ. /
{
ÜÜ 
object
áá 

fieldValue
áá !
=
áá" #
objectGenerator
áá$ 3
.
áá3 4
GenerateObject
áá4 B
(
ááB C
field
ááC H
.
ááH I
	FieldType
ááI R
,
ááR S%
createdObjectReferences
ááT k
)
áák l
;
áál m
field
àà 
.
àà 
SetValue
àà 
(
àà 
obj
àà "
,
àà" #

fieldValue
àà$ .
)
àà. /
;
àà/ 0
}
ââ 
}
ää 	
private
åå 
class
åå '
SimpleTypeObjectGenerator
åå /
{
çç 	
private
éé 
long
éé 
_index
éé 
=
éé  !
$num
éé" #
;
éé# $
private
èè 
static
èè 
readonly
èè #

Dictionary
èè$ .
<
èè. /
Type
èè/ 3
,
èè3 4
Func
èè5 9
<
èè9 :
long
èè: >
,
èè> ?
object
èè@ F
>
èèF G
>
èèG H
DefaultGenerators
èèI Z
=
èè[ \"
InitializeGenerators
èè] q
(
èèq r
)
èèr s
;
èès t
[
ëë 
SuppressMessage
ëë 
(
ëë 
$str
ëë 8
,
ëë8 9
$str
ëë: [
,
ëë[ \
Justification
ëë] j
=
ëëk l
$strëëm ¶
)ëë¶ ß
]ëëß ®
private
íí 
static
íí 

Dictionary
íí %
<
íí% &
Type
íí& *
,
íí* +
Func
íí, 0
<
íí0 1
long
íí1 5
,
íí5 6
object
íí7 =
>
íí= >
>
íí> ?"
InitializeGenerators
íí@ T
(
ííT U
)
ííU V
{
ìì 
return
îî 
new
îî 

Dictionary
îî %
<
îî% &
Type
îî& *
,
îî* +
Func
îî, 0
<
îî0 1
long
îî1 5
,
îî5 6
object
îî7 =
>
îî= >
>
îî> ?
{
ïï 
{
ññ 
typeof
ññ 
(
ññ 
Boolean
ññ $
)
ññ$ %
,
ññ% &
index
ññ' ,
=>
ññ- /
true
ññ0 4
}
ññ5 6
,
ññ6 7
{
óó 
typeof
óó 
(
óó 
Byte
óó !
)
óó! "
,
óó" #
index
óó$ )
=>
óó* ,
(
óó- .
Byte
óó. 2
)
óó2 3
$num
óó3 5
}
óó6 7
,
óó7 8
{
òò 
typeof
òò 
(
òò 
Char
òò !
)
òò! "
,
òò" #
index
òò$ )
=>
òò* ,
(
òò- .
Char
òò. 2
)
òò2 3
$num
òò3 5
}
òò6 7
,
òò7 8
{
ôô 
typeof
ôô 
(
ôô 
DateTime
ôô %
)
ôô% &
,
ôô& '
index
ôô( -
=>
ôô. 0
DateTime
ôô1 9
.
ôô9 :
Now
ôô: =
}
ôô> ?
,
ôô? @
{
öö 
typeof
öö 
(
öö 
DateTimeOffset
öö +
)
öö+ ,
,
öö, -
index
öö. 3
=>
öö4 6
new
öö7 :
DateTimeOffset
öö; I
(
ööI J
DateTime
ööJ R
.
ööR S
Now
ööS V
)
ööV W
}
ööX Y
,
ööY Z
{
õõ 
typeof
õõ 
(
õõ 
DBNull
õõ #
)
õõ# $
,
õõ$ %
index
õõ& +
=>
õõ, .
DBNull
õõ/ 5
.
õõ5 6
Value
õõ6 ;
}
õõ< =
,
õõ= >
{
úú 
typeof
úú 
(
úú 
Decimal
úú $
)
úú$ %
,
úú% &
index
úú' ,
=>
úú- /
(
úú0 1
Decimal
úú1 8
)
úú8 9
index
úú9 >
}
úú? @
,
úú@ A
{
ùù 
typeof
ùù 
(
ùù 
Double
ùù #
)
ùù# $
,
ùù$ %
index
ùù& +
=>
ùù, .
(
ùù/ 0
Double
ùù0 6
)
ùù6 7
(
ùù7 8
index
ùù8 =
+
ùù> ?
$num
ùù@ C
)
ùùC D
}
ùùE F
,
ùùF G
{
ûû 
typeof
ûû 
(
ûû 
Guid
ûû !
)
ûû! "
,
ûû" #
index
ûû$ )
=>
ûû* ,
Guid
ûû- 1
.
ûû1 2
NewGuid
ûû2 9
(
ûû9 :
)
ûû: ;
}
ûû< =
,
ûû= >
{
üü 
typeof
üü 
(
üü 
Int16
üü "
)
üü" #
,
üü# $
index
üü% *
=>
üü+ -
(
üü. /
Int16
üü/ 4
)
üü4 5
(
üü5 6
index
üü6 ;
%
üü< =
Int16
üü> C
.
üüC D
MaxValue
üüD L
)
üüL M
}
üüN O
,
üüO P
{
†† 
typeof
†† 
(
†† 
Int32
†† "
)
††" #
,
††# $
index
††% *
=>
††+ -
(
††. /
Int32
††/ 4
)
††4 5
(
††5 6
index
††6 ;
%
††< =
Int32
††> C
.
††C D
MaxValue
††D L
)
††L M
}
††N O
,
††O P
{
°° 
typeof
°° 
(
°° 
Int64
°° "
)
°°" #
,
°°# $
index
°°% *
=>
°°+ -
(
°°. /
Int64
°°/ 4
)
°°4 5
index
°°5 :
}
°°; <
,
°°< =
{
¢¢ 
typeof
¢¢ 
(
¢¢ 
Object
¢¢ #
)
¢¢# $
,
¢¢$ %
index
¢¢& +
=>
¢¢, .
new
¢¢/ 2
object
¢¢3 9
(
¢¢9 :
)
¢¢: ;
}
¢¢< =
,
¢¢= >
{
££ 
typeof
££ 
(
££ 
SByte
££ "
)
££" #
,
££# $
index
££% *
=>
££+ -
(
££. /
SByte
££/ 4
)
££4 5
$num
££5 7
}
££8 9
,
££9 :
{
§§ 
typeof
§§ 
(
§§ 
Single
§§ #
)
§§# $
,
§§$ %
index
§§& +
=>
§§, .
(
§§/ 0
Single
§§0 6
)
§§6 7
(
§§7 8
index
§§8 =
+
§§> ?
$num
§§@ C
)
§§C D
}
§§E F
,
§§F G
{
•• 
typeof
¶¶ 
(
¶¶ 
String
¶¶ %
)
¶¶% &
,
¶¶& '
index
¶¶( -
=>
¶¶. 0
{
ßß 
return
®® "
String
®®# )
.
®®) *
Format
®®* 0
(
®®0 1
CultureInfo
®®1 <
.
®®< =
CurrentCulture
®®= K
,
®®K L
$str
®®M `
,
®®` a
index
®®b g
)
®®g h
;
®®h i
}
©© 
}
™™ 
,
™™ 
{
´´ 
typeof
¨¨ 
(
¨¨ 
TimeSpan
¨¨ '
)
¨¨' (
,
¨¨( )
index
¨¨* /
=>
¨¨0 2
{
≠≠ 
return
ÆÆ "
TimeSpan
ÆÆ# +
.
ÆÆ+ ,
	FromTicks
ÆÆ, 5
(
ÆÆ5 6
$num
ÆÆ6 =
)
ÆÆ= >
;
ÆÆ> ?
}
ØØ 
}
∞∞ 
,
∞∞ 
{
±± 
typeof
±± 
(
±± 
UInt16
±± #
)
±±# $
,
±±$ %
index
±±& +
=>
±±, .
(
±±/ 0
UInt16
±±0 6
)
±±6 7
(
±±7 8
index
±±8 =
%
±±> ?
UInt16
±±@ F
.
±±F G
MaxValue
±±G O
)
±±O P
}
±±Q R
,
±±R S
{
≤≤ 
typeof
≤≤ 
(
≤≤ 
UInt32
≤≤ #
)
≤≤# $
,
≤≤$ %
index
≤≤& +
=>
≤≤, .
(
≤≤/ 0
UInt32
≤≤0 6
)
≤≤6 7
(
≤≤7 8
index
≤≤8 =
%
≤≤> ?
UInt32
≤≤@ F
.
≤≤F G
MaxValue
≤≤G O
)
≤≤O P
}
≤≤Q R
,
≤≤R S
{
≥≥ 
typeof
≥≥ 
(
≥≥ 
UInt64
≥≥ #
)
≥≥# $
,
≥≥$ %
index
≥≥& +
=>
≥≥, .
(
≥≥/ 0
UInt64
≥≥0 6
)
≥≥6 7
index
≥≥7 <
}
≥≥= >
,
≥≥> ?
{
¥¥ 
typeof
µµ 
(
µµ 
Uri
µµ "
)
µµ" #
,
µµ# $
index
µµ% *
=>
µµ+ -
{
∂∂ 
return
∑∑ "
new
∑∑# &
Uri
∑∑' *
(
∑∑* +
String
∑∑+ 1
.
∑∑1 2
Format
∑∑2 8
(
∑∑8 9
CultureInfo
∑∑9 D
.
∑∑D E
CurrentCulture
∑∑E S
,
∑∑S T
$str
∑∑U s
,
∑∑s t
index
∑∑u z
)
∑∑z {
)
∑∑{ |
;
∑∑| }
}
∏∏ 
}
ππ 
,
ππ 
}
∫∫ 
;
∫∫ 
}
ªª 
public
ΩΩ 
static
ΩΩ 
bool
ΩΩ 
CanGenerateObject
ΩΩ 0
(
ΩΩ0 1
Type
ΩΩ1 5
type
ΩΩ6 :
)
ΩΩ: ;
{
ææ 
return
øø 
DefaultGenerators
øø (
.
øø( )
ContainsKey
øø) 4
(
øø4 5
type
øø5 9
)
øø9 :
;
øø: ;
}
¿¿ 
public
¬¬ 
object
¬¬ 
GenerateObject
¬¬ (
(
¬¬( )
Type
¬¬) -
type
¬¬. 2
)
¬¬2 3
{
√√ 
return
ƒƒ 
DefaultGenerators
ƒƒ (
[
ƒƒ( )
type
ƒƒ) -
]
ƒƒ- .
(
ƒƒ. /
++
ƒƒ/ 1
_index
ƒƒ1 7
)
ƒƒ7 8
;
ƒƒ8 9
}
≈≈ 
}
∆∆ 	
}
«« 
}»» Ò
£C:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\SampleGeneration\SampleDirection.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
{ 
public 

enum 
SampleDirection 
{ 
Request 
= 
$num 
, 
Response		 
}

 
} —
ûC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\SampleGeneration\TextSample.cs
	namespace 	
proyectoTEA
 
. 
Areas 
. 
HelpPage $
{ 
public 

class 

TextSample 
{		 
public

 

TextSample

 
(

 
string

  
text

! %
)

% &
{ 	
if 
( 
text 
== 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 6
)6 7
;7 8
} 
Text 
= 
text 
; 
} 	
public 
string 
Text 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
public 
override 
bool 
Equals #
(# $
object$ *
obj+ .
). /
{ 	

TextSample 
other 
= 
obj "
as# %

TextSample& 0
;0 1
return 
other 
!= 
null  
&&! #
Text$ (
==) +
other, 1
.1 2
Text2 6
;6 7
} 	
public 
override 
int 
GetHashCode '
(' (
)( )
{ 	
return 
Text 
. 
GetHashCode #
(# $
)$ %
;% &
} 	
public   
override   
string   
ToString   '
(  ' (
)  ( )
{!! 	
return"" 
Text"" 
;"" 
}## 	
}$$ 
}%% ¸w
õC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Areas\HelpPage\XmlDocumentationProvider.cs
	namespace

 	
proyectoTEA


 
.

 
Areas

 
.

 
HelpPage

 $
{ 
public 

class $
XmlDocumentationProvider )
:* +"
IDocumentationProvider, B
,B C'
IModelDocumentationProviderD _
{ 
private 
XPathNavigator 
_documentNavigator 1
;1 2
private 
const 
string 
TypeExpression +
=, -
$str. R
;R S
private 
const 
string 
MethodExpression -
=. /
$str0 T
;T U
private 
const 
string 
PropertyExpression /
=0 1
$str2 V
;V W
private 
const 
string 
FieldExpression ,
=- .
$str/ S
;S T
private 
const 
string 
ParameterExpression 0
=1 2
$str3 G
;G H
public $
XmlDocumentationProvider '
(' (
string( .
documentPath/ ;
); <
{ 	
if 
( 
documentPath 
== 
null  $
)$ %
{ 
throw   
new   !
ArgumentNullException   /
(  / 0
$str  0 >
)  > ?
;  ? @
}!! 
XPathDocument"" 
xpath"" 
=""  !
new""" %
XPathDocument""& 3
(""3 4
documentPath""4 @
)""@ A
;""A B
_documentNavigator## 
=##  
xpath##! &
.##& '
CreateNavigator##' 6
(##6 7
)##7 8
;##8 9
}$$ 	
public&& 
string&& 
GetDocumentation&& &
(&&& '$
HttpControllerDescriptor&&' ? 
controllerDescriptor&&@ T
)&&T U
{'' 	
XPathNavigator(( 
typeNode(( #
=(($ %
GetTypeNode((& 1
(((1 2 
controllerDescriptor((2 F
.((F G
ControllerType((G U
)((U V
;((V W
return)) 
GetTagValue)) 
()) 
typeNode)) '
,))' (
$str))) 2
)))2 3
;))3 4
}** 	
public,, 
virtual,, 
string,, 
GetDocumentation,, .
(,,. / 
HttpActionDescriptor,,/ C
actionDescriptor,,D T
),,T U
{-- 	
XPathNavigator.. 

methodNode.. %
=..& '
GetMethodNode..( 5
(..5 6
actionDescriptor..6 F
)..F G
;..G H
return// 
GetTagValue// 
(// 

methodNode// )
,//) *
$str//+ 4
)//4 5
;//5 6
}00 	
public22 
virtual22 
string22 
GetDocumentation22 .
(22. /#
HttpParameterDescriptor22/ F
parameterDescriptor22G Z
)22Z [
{33 	,
 ReflectedHttpParameterDescriptor44 ,(
reflectedParameterDescriptor44- I
=44J K
parameterDescriptor44L _
as44` b-
 ReflectedHttpParameterDescriptor	44c É
;
44É Ñ
if55 
(55 (
reflectedParameterDescriptor55 ,
!=55- /
null550 4
)554 5
{66 
XPathNavigator77 

methodNode77 )
=77* +
GetMethodNode77, 9
(779 :(
reflectedParameterDescriptor77: V
.77V W
ActionDescriptor77W g
)77g h
;77h i
if88 
(88 

methodNode88 
!=88 !
null88" &
)88& '
{99 
string:: 
parameterName:: (
=::) *(
reflectedParameterDescriptor::+ G
.::G H
ParameterInfo::H U
.::U V
Name::V Z
;::Z [
XPathNavigator;; "
parameterNode;;# 0
=;;1 2

methodNode;;3 =
.;;= >
SelectSingleNode;;> N
(;;N O
String;;O U
.;;U V
Format;;V \
(;;\ ]
CultureInfo;;] h
.;;h i
InvariantCulture;;i y
,;;y z 
ParameterExpression	;;{ é
,
;;é è
parameterName
;;ê ù
)
;;ù û
)
;;û ü
;
;;ü †
if<< 
(<< 
parameterNode<< %
!=<<& (
null<<) -
)<<- .
{== 
return>> 
parameterNode>> ,
.>>, -
Value>>- 2
.>>2 3
Trim>>3 7
(>>7 8
)>>8 9
;>>9 :
}?? 
}@@ 
}AA 
returnCC 
nullCC 
;CC 
}DD 	
publicFF 
stringFF $
GetResponseDocumentationFF .
(FF. / 
HttpActionDescriptorFF/ C
actionDescriptorFFD T
)FFT U
{GG 	
XPathNavigatorHH 

methodNodeHH %
=HH& '
GetMethodNodeHH( 5
(HH5 6
actionDescriptorHH6 F
)HHF G
;HHG H
returnII 
GetTagValueII 
(II 

methodNodeII )
,II) *
$strII+ 4
)II4 5
;II5 6
}JJ 	
publicLL 
stringLL 
GetDocumentationLL &
(LL& '

MemberInfoLL' 1
memberLL2 8
)LL8 9
{MM 	
stringNN 

memberNameNN 
=NN 
StringNN  &
.NN& '
FormatNN' -
(NN- .
CultureInfoNN. 9
.NN9 :
InvariantCultureNN: J
,NNJ K
$strNNL U
,NNU V
GetTypeNameNNW b
(NNb c
memberNNc i
.NNi j
DeclaringTypeNNj w
)NNw x
,NNx y
member	NNz Ä
.
NNÄ Å
Name
NNÅ Ö
)
NNÖ Ü
;
NNÜ á
stringOO 

expressionOO 
=OO 
memberOO  &
.OO& '

MemberTypeOO' 1
==OO2 4
MemberTypesOO5 @
.OO@ A
FieldOOA F
?OOG H
FieldExpressionOOI X
:OOY Z
PropertyExpressionOO[ m
;OOm n
stringPP 
selectExpressionPP #
=PP$ %
StringPP& ,
.PP, -
FormatPP- 3
(PP3 4
CultureInfoPP4 ?
.PP? @
InvariantCulturePP@ P
,PPP Q

expressionPPR \
,PP\ ]

memberNamePP^ h
)PPh i
;PPi j
XPathNavigatorQQ 
propertyNodeQQ '
=QQ( )
_documentNavigatorQQ* <
.QQ< =
SelectSingleNodeQQ= M
(QQM N
selectExpressionQQN ^
)QQ^ _
;QQ_ `
returnRR 
GetTagValueRR 
(RR 
propertyNodeRR +
,RR+ ,
$strRR- 6
)RR6 7
;RR7 8
}SS 	
publicUU 
stringUU 
GetDocumentationUU &
(UU& '
TypeUU' +
typeUU, 0
)UU0 1
{VV 	
XPathNavigatorWW 
typeNodeWW #
=WW$ %
GetTypeNodeWW& 1
(WW1 2
typeWW2 6
)WW6 7
;WW7 8
returnXX 
GetTagValueXX 
(XX 
typeNodeXX '
,XX' (
$strXX) 2
)XX2 3
;XX3 4
}YY 	
private[[ 
XPathNavigator[[ 
GetMethodNode[[ ,
([[, - 
HttpActionDescriptor[[- A
actionDescriptor[[B R
)[[R S
{\\ 	)
ReflectedHttpActionDescriptor]] )%
reflectedActionDescriptor]]* C
=]]D E
actionDescriptor]]F V
as]]W Y)
ReflectedHttpActionDescriptor]]Z w
;]]w x
if^^ 
(^^ %
reflectedActionDescriptor^^ )
!=^^* ,
null^^- 1
)^^1 2
{__ 
string`` 
selectExpression`` '
=``( )
String``* 0
.``0 1
Format``1 7
(``7 8
CultureInfo``8 C
.``C D
InvariantCulture``D T
,``T U
MethodExpression``V f
,``f g
GetMemberName``h u
(``u v&
reflectedActionDescriptor	``v è
.
``è ê

MethodInfo
``ê ö
)
``ö õ
)
``õ ú
;
``ú ù
returnaa 
_documentNavigatoraa )
.aa) *
SelectSingleNodeaa* :
(aa: ;
selectExpressionaa; K
)aaK L
;aaL M
}bb 
returndd 
nulldd 
;dd 
}ee 	
privategg 
staticgg 
stringgg 
GetMemberNamegg +
(gg+ ,

MethodInfogg, 6
methodgg7 =
)gg= >
{hh 	
stringii 
nameii 
=ii 
Stringii  
.ii  !
Formatii! '
(ii' (
CultureInfoii( 3
.ii3 4
InvariantCultureii4 D
,iiD E
$striiF O
,iiO P
GetTypeNameiiQ \
(ii\ ]
methodii] c
.iic d
DeclaringTypeiid q
)iiq r
,iir s
methodiit z
.iiz {
Nameii{ 
)	ii Ä
;
iiÄ Å
ParameterInfojj 
[jj 
]jj 

parametersjj &
=jj' (
methodjj) /
.jj/ 0
GetParametersjj0 =
(jj= >
)jj> ?
;jj? @
ifkk 
(kk 

parameterskk 
.kk 
Lengthkk !
!=kk" $
$numkk% &
)kk& '
{ll 
stringmm 
[mm 
]mm 
parameterTypeNamesmm +
=mm, -

parametersmm. 8
.mm8 9
Selectmm9 ?
(mm? @
parammm@ E
=>mmF H
GetTypeNamemmI T
(mmT U
parammmU Z
.mmZ [
ParameterTypemm[ h
)mmh i
)mmi j
.mmj k
ToArraymmk r
(mmr s
)mms t
;mmt u
namenn 
+=nn 
Stringnn 
.nn 
Formatnn %
(nn% &
CultureInfonn& 1
.nn1 2
InvariantCulturenn2 B
,nnB C
$strnnD K
,nnK L
StringnnM S
.nnS T
JoinnnT X
(nnX Y
$strnnY \
,nn\ ]
parameterTypeNamesnn^ p
)nnp q
)nnq r
;nnr s
}oo 
returnqq 
nameqq 
;qq 
}rr 	
privatett 
statictt 
stringtt 
GetTagValuett )
(tt) *
XPathNavigatortt* 8

parentNodett9 C
,ttC D
stringttE K
tagNamettL S
)ttS T
{uu 	
ifvv 
(vv 

parentNodevv 
!=vv 
nullvv "
)vv" #
{ww 
XPathNavigatorxx 
nodexx #
=xx$ %

parentNodexx& 0
.xx0 1
SelectSingleNodexx1 A
(xxA B
tagNamexxB I
)xxI J
;xxJ K
ifyy 
(yy 
nodeyy 
!=yy 
nullyy  
)yy  !
{zz 
return{{ 
node{{ 
.{{  
Value{{  %
.{{% &
Trim{{& *
({{* +
){{+ ,
;{{, -
}|| 
}}} 
return 
null 
; 
}
ÄÄ 	
private
ÇÇ 
XPathNavigator
ÇÇ 
GetTypeNode
ÇÇ *
(
ÇÇ* +
Type
ÇÇ+ /
type
ÇÇ0 4
)
ÇÇ4 5
{
ÉÉ 	
string
ÑÑ  
controllerTypeName
ÑÑ %
=
ÑÑ& '
GetTypeName
ÑÑ( 3
(
ÑÑ3 4
type
ÑÑ4 8
)
ÑÑ8 9
;
ÑÑ9 :
string
ÖÖ 
selectExpression
ÖÖ #
=
ÖÖ$ %
String
ÖÖ& ,
.
ÖÖ, -
Format
ÖÖ- 3
(
ÖÖ3 4
CultureInfo
ÖÖ4 ?
.
ÖÖ? @
InvariantCulture
ÖÖ@ P
,
ÖÖP Q
TypeExpression
ÖÖR `
,
ÖÖ` a 
controllerTypeName
ÖÖb t
)
ÖÖt u
;
ÖÖu v
return
ÜÜ  
_documentNavigator
ÜÜ %
.
ÜÜ% &
SelectSingleNode
ÜÜ& 6
(
ÜÜ6 7
selectExpression
ÜÜ7 G
)
ÜÜG H
;
ÜÜH I
}
áá 	
private
ââ 
static
ââ 
string
ââ 
GetTypeName
ââ )
(
ââ) *
Type
ââ* .
type
ââ/ 3
)
ââ3 4
{
ää 	
string
ãã 
name
ãã 
=
ãã 
type
ãã 
.
ãã 
FullName
ãã '
;
ãã' (
if
åå 
(
åå 
type
åå 
.
åå 
IsGenericType
åå "
)
åå" #
{
çç 
Type
èè 
genericType
èè  
=
èè! "
type
èè# '
.
èè' (&
GetGenericTypeDefinition
èè( @
(
èè@ A
)
èèA B
;
èèB C
Type
êê 
[
êê 
]
êê 
genericArguments
êê '
=
êê( )
type
êê* .
.
êê. /!
GetGenericArguments
êê/ B
(
êêB C
)
êêC D
;
êêD E
string
ëë 
genericTypeName
ëë &
=
ëë' (
genericType
ëë) 4
.
ëë4 5
FullName
ëë5 =
;
ëë= >
genericTypeName
îî 
=
îî  !
genericTypeName
îî" 1
.
îî1 2
	Substring
îî2 ;
(
îî; <
$num
îî< =
,
îî= >
genericTypeName
îî? N
.
îîN O
IndexOf
îîO V
(
îîV W
$char
îîW Z
)
îîZ [
)
îî[ \
;
îî\ ]
string
ïï 
[
ïï 
]
ïï 
argumentTypeNames
ïï *
=
ïï+ ,
genericArguments
ïï- =
.
ïï= >
Select
ïï> D
(
ïïD E
t
ïïE F
=>
ïïG I
GetTypeName
ïïJ U
(
ïïU V
t
ïïV W
)
ïïW X
)
ïïX Y
.
ïïY Z
ToArray
ïïZ a
(
ïïa b
)
ïïb c
;
ïïc d
name
ññ 
=
ññ 
String
ññ 
.
ññ 
Format
ññ $
(
ññ$ %
CultureInfo
ññ% 0
.
ññ0 1
InvariantCulture
ññ1 A
,
ññA B
$str
ññC O
,
ññO P
genericTypeName
ññQ `
,
ññ` a
String
ññb h
.
ññh i
Join
ññi m
(
ññm n
$str
ññn q
,
ññq r 
argumentTypeNamesññs Ñ
)ññÑ Ö
)ññÖ Ü
;ññÜ á
}
óó 
if
òò 
(
òò 
type
òò 
.
òò 
IsNested
òò 
)
òò 
{
ôô 
name
õõ 
=
õõ 
name
õõ 
.
õõ 
Replace
õõ #
(
õõ# $
$str
õõ$ '
,
õõ' (
$str
õõ) ,
)
õõ, -
;
õõ- .
}
úú 
return
ûû 
name
ûû 
;
ûû 
}
üü 	
}
†† 
}°° ù‰
ìC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Controllers\ActividadController.cs
	namespace 	
proyectoTEA
 
. 
Controllers !
{		 
[

 

EnableCors

 
(

 
origins

 
:

 
$str

 
,

 
headers

 "
:

" #
$str

$ '
,

' (
methods

) 0
:

0 1
$str

2 5
)

5 6
]

6 7
[ 
RoutePrefix 
( 
$str 
)  
]  !
public 
class 
ActividadController !
:" #
ApiController$ 1
{ 
[ 
HttpGet 

]
 
[ 
Route 
( 	
$str	 
) 
] 
public 
IHttpActionResult	 
getTypeActivity *
(* +
)+ ,
{ 
try 
{ 
return 

Ok 
( 
new 

LActividad 
( 
) 
. 
getTypeActivity .
(. /
)/ 0
)0 1
;1 2
} 
catch 
(	 

	Exception
 
ex 
) 
{ 
return 


BadRequest 
( 
$str 2
+3 4
ex5 7
.7 8
Message8 ?
.? @
ToString@ H
(H I
)I J
)J K
;K L
} 
} 
[ 
HttpGet 

]
 
[ 
Route 
( 	
$str	 1
)1 2
]2 3
public   
IHttpActionResult  	 
getListaActividades   .
(  . /
int  / 2
id_rol  3 9
,  9 :
string  ; A
id_card  B I
)  I J
{!! 
try"" 
{## 
return$$ 

Ok$$ 
($$ 
new$$ 

LActividad$$ 
($$ 
)$$ 
.$$ 
listaActividades$$ /
($$/ 0
id_rol$$0 6
,$$6 7
id_card$$8 ?
)$$? @
)$$@ A
;$$A B
}%% 
catch&& 
(&&	 
"
NullReferenceException&&
  
ex&&! #
)&&# $
{'' 
return(( 


BadRequest(( 
((( 
$str(( 8
)((8 9
;((9 :
})) 
catch** 
(**	 

	Exception**
 
ex** 
)** 
{++ 
return,, 


BadRequest,, 
(,, 
$str,, 2
+,,3 4
ex,,5 7
.,,7 8
Message,,8 ?
.,,? @
ToString,,@ H
(,,H I
),,I J
),,J K
;,,K L
}-- 
}.. 
[00 
HttpGet00 

]00
 
[11 
Route11 
(11 	
$str11	 (
)11( )
]11) *
public33 
IHttpActionResult33	 
getActivityPerId33 +
(33+ ,
int33, /

idActivity330 :
)33: ;
{44 
try55 
{66 
return77 

Ok77 
(77 
new77 

LActividad77 
(77 
)77 
.77 
getActivityId77 ,
(77, -

idActivity77- 7
)777 8
)778 9
;779 :
}88 
catch99 
(99	 

	Exception99
 
ex99 
)99 
{:: 
return;; 


BadRequest;; 
(;; 
$str;; 2
+;;3 4
ex;;5 7
.;;7 8
Message;;8 ?
.;;? @
ToString;;@ H
(;;H I
);;I J
);;J K
;;;K L
}<< 
}== 
[?? 
HttpPost?? 
]?? 
[@@ 
Route@@ 
(@@ 	
$str@@	 
)@@  
]@@  !
publicAA 
IHttpActionResultAA	  
PostAgregarActividadAA /
(AA/ 0

UActividadAA0 :

actividadEAA; E
)AAE F
{BB 
tryCC 
{DD 
returnEE 

OkEE 
(EE 
newEE 

LActividadEE 
(EE 
)EE 
.EE 
agregarActividadEE /
(EE/ 0

actividadEEE0 :
)EE: ;
)EE; <
;EE< =
}FF 
catchGG 
(GG	 

	ExceptionGG
 
exGG 
)GG 
{HH 
returnII 


BadRequestII 
(II 
$strII 2
+II3 4
exII5 7
.II7 8
MessageII8 ?
.II? @
ToStringII@ H
(IIH I
)III J
)IIJ K
;IIK L
}JJ 
}KK 
[OO 
RouteOO 
(OO 	
$strOO	 0
)OO0 1
]OO1 2
[PP 

HttpDeletePP 
]PP 
publicQQ 
IHttpActionResultQQ	 "
PutActividadDesActivarQQ 1
(QQ1 2
stringQQ2 8
actividad_idQQ9 E
)QQE F
{RR 
stringSS 	
messageSS
 
;SS 
tryTT 
{UU 
messageVV 
=VV 
newVV 

LActividadVV 
(VV 
)VV 
.VV '
activarODesactivarActividadVV :
(VV: ;
intVV; >
.VV> ?
ParseVV? D
(VVD E
actividad_idVVE Q
)VVQ R
)VVR S
;VVS T
returnWW 

OkWW 
(WW 
messageWW 
)WW 
;WW 
}XX 
catchYY 
(YY	 

	ExceptionYY
 
exYY 
)YY 
{ZZ 
return[[ 


BadRequest[[ 
([[ 
$str[[ 2
+[[3 4
ex[[5 7
.[[7 8
Message[[8 ?
.[[? @
ToString[[@ H
([[H I
)[[I J
)[[J K
;[[K L
}\\ 
}]] 
[__ 
Route__ 
(__ 	
$str__	 "
)__" #
]__# $
[`` 
HttpPost`` 
]`` 
publicaa 
IHttpActionResultaa	 #
PostActividadEstudianteaa 2
(aa2 3

UActividadaa3 =

uActividadaa> H
)aaH I
{bb 
stringcc 	
messagecc
 
;cc 
trydd 
{ee 
messageff 
=ff 
newff 

LActividadff 
(ff 
)ff 
.ff #
postActividadEstudianteff 6
(ff6 7

uActividadff7 A
)ffA B
;ffB C
returngg 

Okgg 
(gg 
messagegg 
)gg 
;gg 
}hh 
catchii 
(ii	 

	Exceptionii
 
exii 
)ii 
{jj 
returnkk 


BadRequestkk 
(kk 
$strkk 2
+kk3 4
exkk5 7
.kk7 8
Messagekk8 ?
.kk? @
ToStringkk@ H
(kkH I
)kkI J
)kkJ K
;kkK L
}ll 
}mm 
[oo 
Routeoo 
(oo 	
$stroo	 N
)ooN O
]ooO P
[pp 
HttpGetpp 

]pp
 
publicqq 
IHttpActionResultqq	 /
#GetAcivitysMakedByPatientForTeacherqq >
(qq> ?
intqq? B
id_activityqqC N
,qqN O
stringqqP V
id_card_teacherqqW f
)qqf g
{rr 
tryss 
{tt 
Listuu 
<uu 	
	UPacienteuu	 
>uu 
	respuestauu 
=uu 
newuu  #

LActividaduu$ .
(uu. /
)uu/ 0
.uu0 1-
!getAcivitysDidByPatientForTeacheruu1 R
(uuR S
id_activityuuS ^
,uu^ _
id_card_teacheruu` o
)uuo p
;uup q
ifvv 
(vv 
	respuestavv 
!=vv 
nullvv 
)vv 
{ww 
returnxx 
Okxx 
(xx 
	respuestaxx 
)xx 
;xx 
}yy 
elsezz 
{{{ 
return}} 

BadRequest}} 
(}} 
$str}} E
)}}E F
;}}F G
}~~ 
} 
catch
ÄÄ 
(
ÄÄ	 

	Exception
ÄÄ
 
ex
ÄÄ 
)
ÄÄ 
{
ÅÅ 
return
ÇÇ 


BadRequest
ÇÇ 
(
ÇÇ 
$str
ÇÇ 2
+
ÇÇ3 4
ex
ÇÇ5 7
.
ÇÇ7 8
Message
ÇÇ8 ?
.
ÇÇ? @
ToString
ÇÇ@ H
(
ÇÇH I
)
ÇÇI J
)
ÇÇJ K
;
ÇÇK L
}
ÉÉ 
}
ÑÑ 
[
ÜÜ 
Route
ÜÜ 
(
ÜÜ 	
$str
ÜÜ	 R
)
ÜÜR S
]
ÜÜS T
[
áá 
HttpGet
áá 

]
áá
 
public
àà 
IHttpActionResult
àà	 3
%GetAcivitysMakedByPatientForAttendant
àà @
(
àà@ A
int
ààA D
id_activity
ààE P
,
ààP Q
string
ààR X
id_card_attendant
ààY j
)
ààj k
{
ââ 
try
ää 
{
ãã 
List
çç 
<
çç 	
	UPaciente
çç	 
>
çç 
	respuesta
çç 
=
çç 
new
çç  #

LActividad
çç$ .
(
çç. /
)
çç/ 0
.
çç0 11
#getAcivitysDidByPatientForAttendant
çç1 T
(
ççT U
id_activity
ççU `
,
çç` a
id_card_attendant
ççb s
)
ççs t
;
ççt u
if
éé 
(
éé 
	respuesta
éé 
!=
éé 
null
éé 
)
éé 
{
èè 
return
êê 
Ok
êê 
(
êê 
	respuesta
êê 
)
êê 
;
êê 
}
ëë 
else
íí 
{
ìì 
return
îî 
NotFound
îî 
(
îî 
)
îî 
;
îî 
}
ïï 
}
ññ 
catch
óó 
(
óó	 

	Exception
óó
 
ex
óó 
)
óó 
{
òò 
return
ôô 


BadRequest
ôô 
(
ôô 
$str
ôô 2
+
ôô3 4
ex
ôô5 7
.
ôô7 8
Message
ôô8 ?
.
ôô? @
ToString
ôô@ H
(
ôôH I
)
ôôI J
)
ôôJ K
;
ôôK L
}
öö 
}
õõ 
[
ùù 
Route
ùù 
(
ùù 	
$str
ùù	 '
)
ùù' (
]
ùù( )
[
ûû 
HttpGet
ûû 

]
ûû
 
public
üü 
IHttpActionResult
üü	 *
GetEvaluacionInicialCiencias
üü 7
(
üü7 8
)
üü8 9
{
†† 
List
°° 
<
°°  
UEvaluacionInicial
°° 
>
°° 
	respuesta
°° %
=
°°& '
new
°°( +

LActividad
°°, 6
(
°°6 7
)
°°7 8
.
°°8 91
#getListActivitysToInicialEvaluation
°°9 \
(
°°\ ]
$num
°°] ^
)
°°^ _
;
°°_ `
return
¢¢ 	
Ok
¢¢
 
(
¢¢ 
	respuesta
¢¢ 
)
¢¢ 
;
¢¢ 
}
££ 
[
¶¶ 
Route
¶¶ 
(
¶¶ 	
$str
¶¶	 *
)
¶¶* +
]
¶¶+ ,
[
ßß 
HttpGet
ßß 

]
ßß
 
public
®® 
IHttpActionResult
®®	 -
GetEvaluacionInicialMatematicas
®® :
(
®®: ;
)
®®; <
{
©© 
List
™™ 
<
™™  
UEvaluacionInicial
™™ 
>
™™ 
	respuesta
™™ %
=
™™& '
new
™™( +

LActividad
™™, 6
(
™™6 7
)
™™7 8
.
™™8 91
#getListActivitysToInicialEvaluation
™™9 \
(
™™\ ]
$num
™™] ^
)
™™^ _
;
™™_ `
return
´´ 	
Ok
´´
 
(
´´ 
	respuesta
´´ 
)
´´ 
;
´´ 
}
¨¨ 
[
ØØ 
Route
ØØ 
(
ØØ 	
$str
ØØ	 +
)
ØØ+ ,
]
ØØ, -
[
∞∞ 
HttpGet
∞∞ 

]
∞∞
 
public
±± 
IHttpActionResult
±±	 .
 GetEvaluacionInicialComunicacion
±± ;
(
±±; <
)
±±< =
{
≤≤ 
List
≥≥ 
<
≥≥  
UEvaluacionInicial
≥≥ 
>
≥≥ 
	respuesta
≥≥ %
=
≥≥& '
new
≥≥( +

LActividad
≥≥, 6
(
≥≥6 7
)
≥≥7 8
.
≥≥8 91
#getListActivitysToInicialEvaluation
≥≥9 \
(
≥≥\ ]
$num
≥≥] ^
)
≥≥^ _
;
≥≥_ `
return
¥¥ 	
Ok
¥¥
 
(
¥¥ 
	respuesta
¥¥ 
)
¥¥ 
;
¥¥ 
}
µµ 
[
∑∑ 
Route
∑∑ 
(
∑∑ 	
$str
∑∑	 2
)
∑∑2 3
]
∑∑3 4
[
∏∏ 
HttpGet
∏∏ 

]
∏∏
 
public
ππ 
IHttpActionResult
ππ	 5
'GetEvaluacionInicialHabilidadesSociales
ππ B
(
ππB C
)
ππC D
{
∫∫ 
List
ªª 
<
ªª  
UEvaluacionInicial
ªª 
>
ªª 
	respuesta
ªª %
=
ªª& '
new
ªª( +

LActividad
ªª, 6
(
ªª6 7
)
ªª7 8
.
ªª8 91
#getListActivitysToInicialEvaluation
ªª9 \
(
ªª\ ]
$num
ªª] ^
)
ªª^ _
;
ªª_ `
return
ºº 	
Ok
ºº
 
(
ºº 
	respuesta
ºº 
)
ºº 
;
ºº 
}
ΩΩ 
[
øø 
Route
øø 
(
øø 	
$str
øø	 ;
)
øø; <
]
øø< =
[
¿¿ 
HttpGet
¿¿ 

]
¿¿
 
public
¡¡ 
IHttpActionResult
¡¡	 
GetResulActivity
¡¡ +
(
¡¡+ ,
int
¡¡, /
id_activity
¡¡0 ;
,
¡¡; <
string
¡¡= C
id_card_patient
¡¡D S
)
¡¡S T
{
¬¬ 
try
√√ 
{
ƒƒ 
List
∆∆ 
<
∆∆ 	
PacienteScoreJSon
∆∆	 
>
∆∆ 
	respuesta
∆∆ %
=
∆∆& '
new
∆∆( +

LActividad
∆∆, 6
(
∆∆6 7
)
∆∆7 8
.
∆∆8 9
getResultActivity
∆∆9 J
(
∆∆J K
id_activity
∆∆K V
,
∆∆V W
id_card_patient
∆∆X g
)
∆∆g h
;
∆∆h i
if
«« 
(
«« 
	respuesta
«« 
!=
«« 
null
«« 
)
«« 
{
»» 
return
…… 
Ok
…… 
(
…… 
	respuesta
…… 
)
…… 
;
…… 
}
   
else
ÀÀ 
{
ÃÃ 
return
ÕÕ 
NotFound
ÕÕ 
(
ÕÕ 
)
ÕÕ 
;
ÕÕ 
}
ŒŒ 
}
œœ 
catch
–– 
(
––	 

	Exception
––
 
ex
–– 
)
–– 
{
—— 
return
““ 


BadRequest
““ 
(
““ 
$str
““ 2
+
““3 4
ex
““5 7
.
““7 8
Message
““8 ?
.
““? @
ToString
““@ H
(
““H I
)
““I J
)
““J K
;
““K L
}
”” 
}
‘‘ 
[
◊◊ 
Route
◊◊ 
(
◊◊ 	
$str
◊◊	 B
)
◊◊B C
]
◊◊C D
[
ÿÿ 
HttpGet
ÿÿ 

]
ÿÿ
 
public
ŸŸ 
IHttpActionResult
ŸŸ	 '
GetScoreImitationActivity
ŸŸ 4
(
ŸŸ4 5
string
ŸŸ5 ;
phrases_base
ŸŸ< H
,
ŸŸH I
string
ŸŸJ P
phrases_said
ŸŸQ ]
)
ŸŸ] ^
{
⁄⁄ 
try
€€ 
{
‹‹ 
return
›› 

Ok
›› 
(
›› 
new
›› 

LActividad
›› 
(
›› 
)
›› 
.
›› '
getScoreActivityImitation
›› 8
(
››8 9
phrases_base
››9 E
,
››E F
phrases_said
››G S
)
››S T
)
››T U
;
››U V
}
ﬁﬁ 
catch
ﬂﬂ 
(
ﬂﬂ	 

	Exception
ﬂﬂ
 
ex
ﬂﬂ 
)
ﬂﬂ 
{
‡‡ 
return
·· 


BadRequest
·· 
(
·· 
$str
·· 2
+
··3 4
ex
··5 7
.
··7 8
Message
··8 ?
.
··? @
ToString
··@ H
(
··H I
)
··I J
)
··J K
;
··K L
}
‚‚ 
}
„„ 
[
ÊÊ 
Route
ÊÊ 
(
ÊÊ 	
$str
ÊÊ	 1
)
ÊÊ1 2
]
ÊÊ2 3
[
ÁÁ 
HttpPost
ÁÁ 
]
ÁÁ 
public
ËË 
IHttpActionResult
ËË	 4
&PostGuardarResultadosEvaluacionInicial
ËË A
(
ËËA B)
UResultadoEvaluacionInicial
ËËB ]
[
ËË] ^
]
ËË^ _

actividadE
ËË` j
)
ËËj k
{
ÈÈ 
try
ÍÍ 
{
ÎÎ 
return
ÏÏ 

Ok
ÏÏ 
(
ÏÏ 
new
ÏÏ 

LActividad
ÏÏ 
(
ÏÏ 
)
ÏÏ 
.
ÏÏ 
guardarResultados
ÏÏ 0
(
ÏÏ0 1

actividadE
ÏÏ1 ;
)
ÏÏ; <
)
ÏÏ< =
;
ÏÏ= >
}
ÌÌ 
catch
ÓÓ 
(
ÓÓ	 

	Exception
ÓÓ
 
ex
ÓÓ 
)
ÓÓ 
{
ÔÔ 
return
 


BadRequest
 
(
 
$str
 2
+
3 4
ex
5 7
.
7 8
Message
8 ?
.
? @
ToString
@ H
(
H I
)
I J
)
J K
;
K L
}
ÛÛ 
}
ÙÙ 
[
˜˜ 
Route
˜˜ 
(
˜˜ 	
$str
˜˜	 8
)
˜˜8 9
]
˜˜9 :
[
¯¯ 
HttpGet
¯¯ 

]
¯¯
 
public
˘˘ 
IHttpActionResult
˘˘	 
GetCtegoriaPECS
˘˘ *
(
˘˘* +
string
˘˘+ 1

id_docente
˘˘2 <
,
˘˘< =
string
˘˘> D
id_estudiante
˘˘E R
)
˘˘R S
{
˙˙ 
try
˚˚ 
{
¸¸ 
return
˝˝ 

Ok
˝˝ 
(
˝˝ 
new
˝˝ 

LActividad
˝˝ 
(
˝˝ 
)
˝˝ 
.
˝˝ 
categoriasPECS
˝˝ -
(
˝˝- .

id_docente
˝˝. 8
,
˝˝8 9
id_estudiante
˝˝: G
)
˝˝G H
)
˝˝H I
;
˝˝I J
}
˛˛ 
catch
ˇˇ 
(
ˇˇ	 

	Exception
ˇˇ
 
ex
ˇˇ 
)
ˇˇ 
{
ÄÄ 
return
ÅÅ 


BadRequest
ÅÅ 
(
ÅÅ 
$str
ÅÅ 2
+
ÅÅ3 4
ex
ÅÅ5 7
.
ÅÅ7 8
Message
ÅÅ8 ?
.
ÅÅ? @
ToString
ÅÅ@ H
(
ÅÅH I
)
ÅÅI J
)
ÅÅJ K
;
ÅÅK L
}
ÇÇ 
}
ÉÉ 
[
ÖÖ 
Route
ÖÖ 
(
ÖÖ 	
$str
ÖÖ	 @
)
ÖÖ@ A
]
ÖÖA B
[
ÜÜ 
HttpGet
ÜÜ 

]
ÜÜ
 
public
áá 
IHttpActionResult
áá	 &
GetCantidadCategoriaPECS
áá 3
(
áá3 4
string
áá4 :

id_docente
áá; E
,
ááE F
string
ááG M
id_estudiante
ááN [
)
áá[ \
{
àà 
try
ââ 
{
ää 
return
ãã 

Ok
ãã 
(
ãã 
new
ãã 

LActividad
ãã 
(
ãã 
)
ãã 
.
ãã $
cantidadCategoriasPECS
ãã 5
(
ãã5 6

id_docente
ãã6 @
,
ãã@ A
id_estudiante
ããB O
)
ããO P
)
ããP Q
;
ããQ R
}
åå 
catch
çç 
(
çç	 

	Exception
çç
 
ex
çç 
)
çç 
{
éé 
return
èè 


BadRequest
èè 
(
èè 
$str
èè 2
+
èè3 4
ex
èè5 7
.
èè7 8
Message
èè8 ?
.
èè? @
ToString
èè@ H
(
èèH I
)
èèI J
)
èèJ K
;
èèK L
}
êê 
}
ëë 
[
ìì 
Route
ìì 
(
ìì 	
$str
ìì	 .
)
ìì. /
]
ìì/ 0
[
îî 
HttpGet
îî 

]
îî
 
public
ïï 
IHttpActionResult
ïï	 
GetCategoriasPECS
ïï ,
(
ïï, -
string
ïï- 3

id_docente
ïï4 >
)
ïï> ?
{
ññ 
try
óó 
{
òò 
return
ôô 

Ok
ôô 
(
ôô 
new
ôô 

LActividad
ôô 
(
ôô 
)
ôô 
.
ôô 
categoriasPECS
ôô -
(
ôô- .

id_docente
ôô. 8
)
ôô8 9
)
ôô9 :
;
ôô: ;
}
öö 
catch
õõ 
(
õõ	 

	Exception
õõ
 
ex
õõ 
)
õõ 
{
úú 
return
ùù 


BadRequest
ùù 
(
ùù 
$str
ùù 2
+
ùù3 4
ex
ùù5 7
.
ùù7 8
Message
ùù8 ?
.
ùù? @
ToString
ùù@ H
(
ùùH I
)
ùùI J
)
ùùJ K
;
ùùK L
}
ûû 
}
üü 
[
°° 
Route
°° 
(
°° 	
$str
°°	 F
)
°°F G
]
°°G H
[
¢¢ 
HttpGet
¢¢ 

]
¢¢
 
public
££ 
IHttpActionResult
££	 
GetImagenesPECS
££ *
(
££* +
string
££+ 1

id_docente
££2 <
,
££< =
string
££> D
id_estudiante
££E R
,
££R S
int
££T W
categoria_id
££X d
)
££d e
{
§§ 
try
•• 
{
¶¶ 
return
ßß 

Ok
ßß 
(
ßß 
new
ßß 

LActividad
ßß 
(
ßß 
)
ßß 
.
ßß 
imagenesPECS
ßß +
(
ßß+ ,

id_docente
ßß, 6
,
ßß6 7
id_estudiante
ßß8 E
,
ßßE F
categoria_id
ßßG S
)
ßßS T
)
ßßT U
;
ßßU V
}
®® 
catch
©© 
(
©©	 

	Exception
©©
 
ex
©© 
)
©© 
{
™™ 
return
´´ 


BadRequest
´´ 
(
´´ 
$str
´´ 2
+
´´3 4
ex
´´5 7
.
´´7 8
Message
´´8 ?
.
´´? @
ToString
´´@ H
(
´´H I
)
´´I J
)
´´J K
;
´´K L
}
¨¨ 
}
≠≠ 
[
ØØ 
Route
ØØ 
(
ØØ 	
$str
ØØ	 0
)
ØØ0 1
]
ØØ1 2
[
∞∞ 

HttpDelete
∞∞ 
]
∞∞ 
public
±± 
IHttpActionResult
±±	 $
PutCategoriaDesActivar
±± 1
(
±±1 2
string
±±2 8
actividad_id
±±9 E
)
±±E F
{
≤≤ 
string
≥≥ 	
message
≥≥
 
;
≥≥ 
try
¥¥ 
{
µµ 
message
∂∂ 
=
∂∂ 
new
∂∂ 

LActividad
∂∂ 
(
∂∂ 
)
∂∂ 
.
∂∂ )
activar_DesactivarCategoria
∂∂ :
(
∂∂: ;
int
∂∂; >
.
∂∂> ?
Parse
∂∂? D
(
∂∂D E
actividad_id
∂∂E Q
)
∂∂Q R
)
∂∂R S
;
∂∂S T
return
∑∑ 

Ok
∑∑ 
(
∑∑ 
message
∑∑ 
)
∑∑ 
;
∑∑ 
}
∏∏ 
catch
ππ 
(
ππ	 

	Exception
ππ
 
ex
ππ 
)
ππ 
{
∫∫ 
return
ªª 


BadRequest
ªª 
(
ªª 
$str
ªª 2
+
ªª3 4
ex
ªª5 7
.
ªª7 8
Message
ªª8 ?
.
ªª? @
ToString
ªª@ H
(
ªªH I
)
ªªI J
)
ªªJ K
;
ªªK L
}
ºº 
}
ΩΩ 
[
øø 
Route
øø 
(
øø 	
$str
øø	 
)
øø  
]
øø  !
[
¿¿ 
HttpPost
¿¿ 
]
¿¿ 
public
¡¡ 
IHttpActionResult
¡¡	 "
PostAgregarCategoria
¡¡ /
(
¡¡/ 0&
UActividadPecsCategorias
¡¡0 H"
PostAgregarCategoria
¡¡I ]
)
¡¡] ^
{
¬¬ 
try
√√ 
{
ƒƒ 
return
≈≈ 

Ok
≈≈ 
(
≈≈ 
new
≈≈ 

LActividad
≈≈ 
(
≈≈ 
)
≈≈ 
.
≈≈ 
guardarCategoria
≈≈ /
(
≈≈/ 0"
PostAgregarCategoria
≈≈0 D
)
≈≈D E
)
≈≈E F
;
≈≈F G
}
∆∆ 
catch
«« 
(
««	 

	Exception
««
 
ex
«« 
)
«« 
{
»» 
return
…… 


BadRequest
…… 
(
…… 
$str
…… 2
+
……3 4
ex
……5 7
.
……7 8
Message
……8 ?
.
……? @
ToString
……@ H
(
……H I
)
……I J
)
……J K
;
……K L
}
ÃÃ 
}
ÕÕ 
[
œœ 
Route
œœ 
(
œœ 	
$str
œœ	 )
)
œœ) *
]
œœ* +
[
–– 
HttpPost
–– 
]
–– 
public
—— 
IHttpActionResult
——	 ,
PostAgregarActividadImagenPECS
—— 9
(
——9 :
UActividadPecs
——: H"
PostAgregarActividad
——I ]
)
——] ^
{
““ 
try
”” 
{
‘‘ 
return
’’ 

Ok
’’ 
(
’’ 
new
’’ 

LActividad
’’ 
(
’’ 
)
’’ 
.
’’ (
guardarActividadPECSImagen
’’ 9
(
’’9 :"
PostAgregarActividad
’’: N
)
’’N O
)
’’O P
;
’’P Q
}
÷÷ 
catch
◊◊ 
(
◊◊	 

	Exception
◊◊
 
ex
◊◊ 
)
◊◊ 
{
ÿÿ 
return
ŸŸ 


BadRequest
ŸŸ 
(
ŸŸ 
$str
ŸŸ 2
+
ŸŸ3 4
ex
ŸŸ5 7
.
ŸŸ7 8
Message
ŸŸ8 ?
.
ŸŸ? @
ToString
ŸŸ@ H
(
ŸŸH I
)
ŸŸI J
)
ŸŸJ K
;
ŸŸK L
}
‹‹ 
}
›› 
[
ﬁﬁ 
HttpGet
ﬁﬁ 

]
ﬁﬁ
 
[
ﬂﬂ 
Route
ﬂﬂ 
(
ﬂﬂ 	
$str
ﬂﬂ	 #
)
ﬂﬂ# $
]
ﬂﬂ$ %
public
‡‡ 
IHttpActionResult
‡‡	 &
GetListStudentEvaluation
‡‡ 3
(
‡‡3 4
)
‡‡4 5
{
·· 
try
‚‚ 
{
„„ 
return
‰‰ 

Ok
‰‰ 
(
‰‰ 
new
‰‰ 

LActividad
‰‰ 
(
‰‰ 
)
‰‰ 
.
‰‰ "
getStudienEvaluation
‰‰ 3
(
‰‰3 4
)
‰‰4 5
)
‰‰5 6
;
‰‰6 7
}
ÂÂ 
catch
ÊÊ 
(
ÊÊ	 
$
NullReferenceException
ÊÊ
  
ex
ÊÊ! #
)
ÊÊ# $
{
ÁÁ 
return
ËË 


BadRequest
ËË 
(
ËË 
$str
ËË >
)
ËË> ?
;
ËË? @
}
ÈÈ 
catch
ÍÍ 
(
ÍÍ	 

	Exception
ÍÍ
 
ex
ÍÍ 
)
ÍÍ 
{
ÎÎ 
return
ÏÏ 


BadRequest
ÏÏ 
(
ÏÏ 
$str
ÏÏ 2
+
ÏÏ3 4
ex
ÏÏ5 7
.
ÏÏ7 8
Message
ÏÏ8 ?
.
ÏÏ? @
ToString
ÏÏ@ H
(
ÏÏH I
)
ÏÏI J
)
ÏÏJ K
;
ÏÏK L
}
ÌÌ 
}
ÓÓ 
[
ÔÔ 
HttpGet
ÔÔ 

]
ÔÔ
 
[
 
Route
 
(
 	
$str
	 -
)
- .
]
. /
public
ÚÚ 
IHttpActionResult
ÚÚ	 &
getScoreStudenEvaluation
ÚÚ 3
(
ÚÚ3 4
string
ÚÚ4 :
id_card
ÚÚ; B
)
ÚÚB C
{
ÛÛ 
try
ÙÙ 
{
ıı 
return
ˆˆ 

Ok
ˆˆ 
(
ˆˆ 
new
ˆˆ 

LActividad
ˆˆ 
(
ˆˆ 
)
ˆˆ 
.
ˆˆ  
getScoreEvaluation
ˆˆ 1
(
ˆˆ1 2
id_card
ˆˆ2 9
)
ˆˆ9 :
)
ˆˆ: ;
;
ˆˆ; <
}
˜˜ 
catch
¯¯ 
(
¯¯	 
$
NullReferenceException
¯¯
  
ex
¯¯! #
)
¯¯# $
{
˘˘ 
return
˙˙ 


BadRequest
˙˙ 
(
˙˙ 
$str
˙˙ 8
)
˙˙8 9
;
˙˙9 :
}
˚˚ 
catch
¸¸ 
(
¸¸	 

	Exception
¸¸
 
ex
¸¸ 
)
¸¸ 
{
˝˝ 
return
˛˛ 


BadRequest
˛˛ 
(
˛˛ 
$str
˛˛ 2
+
˛˛3 4
ex
˛˛5 7
.
˛˛7 8
Message
˛˛8 ?
.
˛˛? @
ToString
˛˛@ H
(
˛˛H I
)
˛˛I J
)
˛˛J K
;
˛˛K L
}
ˇˇ 
}
ÄÄ 
}
ÇÇ 
}ÉÉ ¿
éC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Controllers\HomeController.cs
	namespace 	
proyectoTEA
 
. 
Controllers !
{ 
public		 
class		 
HomeController		 
:		 

Controller		 )
{

 
public 
ActionResult	 
Index 
( 
) 
{ 
ViewBag 

.
 
Title 
= 
$str 
; 
return 	
View
 
( 
) 
; 
} 
} 
} ‡K
èC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Controllers\LoginController.cs
	namespace

 	
proyectoTEA


 
.

 
Controllers

 !
{ 
[ 

EnableCors 
( 
origins 
: 
$str 
, 
headers %
:% &
$str' *
,* +
methods, 3
:3 4
$str5 8
)8 9
]9 :
[ 
RoutePrefix 
( 
$str 
) 
] 
public 

class 
LoginController  
:! "
ApiController# 0
{ 
[ 	
HttpPost	 
] 
[ 	
Route	 
( 
$str !
)! "
]" #
public 
async	 
Task 
< 
IHttpActionResult %
>% &
PostIngresoLogin' 7
(7 8
UUsers8 >
usuarioE? G
)G H
{ 
UTokenCompra 
validacionCompra )
=* +
new, /
UTokenCompra0 <
(< =
)= >
;> ?
try 
{ 
if 
( 
usuarioE 
. 
Rol_id #
==$ &
$num' (
)( )
{ 
validacionCompra 
= 
await 
new !
LUserRegistercs" 1
(1 2
)2 3
.3 4
obtenerDatosCompra4 F
(F G
usuarioEG O
.O P
	DocumentoP Y
)Y Z
;Z [
} 
else 
if 
( 
usuarioE !
.! "
Rol_id" (
!=) +
$num, -
)- .
{ 
validacionCompra   
.   
Token   
=   
$str   "
;  " #
}!! 
if$$ 
($$ 
validacionCompra$$ $
==$$% '
null$$( ,
)$$, -
{%% 
return&& 

BadRequest&& %
(&&% &
$str&&& V
)&&V W
;&&W X
}'' 
else(( 
if(( 
((( 
validacionCompra(( (
!=(() +
null((, 0
)((0 1
{)) 
Wraper** 
wp** 
=** 
new**  #
Wraper**$ *
(*** +
)**+ ,
;**, -
wp++ 
=++ 
await++ 
new++ "
LIngresoLogin++# 0
(++0 1
)++1 2
.++2 3
ingresoLogin++3 ?
(++? @
usuarioE++@ H
)++H I
;++I J
if-- 
(-- 
wp-- 
.-- 
WraperUsuario-- (
==--) +
null--, 0
)--0 1
{.. 
return// 

BadRequest// )
(//) *
wp//* ,
.//, -
Mensaje//- 4
)//4 5
;//5 6
}00 
else11 
{22 
usuarioE33  
.33  !
Rol_id33! '
=33( )
wp33* ,
.33, -
WraperUsuario33- :
.33: ;
Rol_id33; A
;33A B
wp44 
.44 
Token44  
=44! "
TokenGenerator44# 1
.441 2
GenerateTokenJwt442 B
(44B C
usuarioE44C K
)44K L
;44L M
return55 
Ok55 !
(55! "
wp55" $
)55$ %
;55% &
}66 
}77 
else88 
{99 
return:: 

BadRequest:: %
(::% &
)::& '
;::' (
};; 
}<< 
catch== 
(==	 

	Exception==
 
ex== 
)== 
{>> 
return?? 

InternalServerError?? 
(?? 
ex?? !
)??! "
;??" #
}@@ 
}AA 
[CC 	
HttpPostCC	 
]CC 
[DD 	
RouteDD	 
(DD 
$strDD !
)DD! "
]DD" #
publicFF 
IHttpActionResultFF  
postCerrarSesionFF! 1
(FF1 2
[FF2 3
FromBodyFF3 ;
]FF; <
JObjectFF= D
usuarioFFE L
)FFL M
{GG 	
tryHH 
{II 
UUsersJJ 
datosJJ 
=JJ 
newJJ "
UUsersJJ# )
(JJ) *
)JJ* +
;JJ+ ,
datosKK 
.KK 
	DocumentoKK 
=KK  !
usuarioKK" )
[KK) *
$strKK* 3
]KK3 4
.KK4 5
ToStringKK5 =
(KK= >
)KK> ?
;KK? @
returnLL 
OkLL 
(LL 
newLL 
LIngresoLoginLL +
(LL+ ,
)LL, -
.LL- .
cerrarsessionLL. ;
(LL; <
datosLL< A
)LLA B
)LLB C
;LLC D
}MM 
catchNN 
(NN 
	ExceptionNN 
exNN 
)NN  
{OO 
varPP 
mensajePP 
=PP 
$strPP :
+PP; <
exPP= ?
.PP? @
MessagePP@ G
.PPG H
ToStringPPH P
(PPP Q
)PPQ R
;PPR S
returnQQ 

BadRequestQQ !
(QQ! "
mensajeQQ" )
)QQ) *
;QQ* +
}RR 
}TT 	
[VV 
HttpPutVV 

]VV
 
[WW 
RouteWW 
(WW 	
$strWW	 "
)WW" #
]WW# $
publicYY 
asyncYY	 
TaskYY 
<YY 
IHttpActionResultYY %
>YY% &#
PutCorreoRecuperarClaveYY' >
(YY> ?
UDocenteYY? G
usuarioYYH O
)YYO P
{ZZ 
try[[ 
{\\ 
string]] 
!
enviarCorreoRecuperar]]  
=]]! "
new]]# &
LIngresoLogin]]' 4
(]]4 5
)]]5 6
.]]6 7&
enviarCorreoDeRecuperacion]]7 Q
(]]Q R
usuario]]R Y
.]]Y Z
Correo]]Z `
)]]` a
;]]a b
if^^ 
(^^ !
enviarCorreoRecuperar^^ 
!=^^  
null^^! %
)^^% &
{__ 
return`` 
Ok`` 
(`` !
enviarCorreoRecuperar`` $
)``$ %
;``% &
}aa 
returnbb 


BadRequestbb 
(bb 
$strbb 0
)bb0 1
;bb1 2
}cc 
catchdd 
(dd	 

	Exceptiondd
 
exdd 
)dd 
{ee 
returnff 

InternalServerErrorff 
(ff 
exff !
)ff! "
;ff" #
}gg 
}hh 
[ii 
HttpGetii 

]ii
 
[jj 
Routejj 
(jj 	
$strjj	 !
)jj! "
]jj" #
publickk 
asynckk	 
Taskkk 
<kk 
IHttpActionResultkk %
>kk% &
GetAccesoClavekk' 5
(kk5 6
stringkk6 <
tokenkk= B
)kkB C
{ll 
trymm 
{nn 
stringoo 

accessoClaveNuevaoo 
=oo 
newoo "
LIngresoLoginoo# 0
(oo0 1
)oo1 2
.oo2 3 
accesoTokenRecuperaroo3 G
(ooG H
tokenooH M
)ooM N
;ooN O
ifpp 
(pp 
accessoClaveNuevapp 
.pp 
Equalspp  
(pp  !
$strpp! 1
)pp1 2
)pp2 3
{qq 
returnrr 
Okrr 
(rr 
accessoClaveNuevarr  
)rr  !
;rr! "
}ss 
returntt 


BadRequesttt 
(tt 
accessoClaveNuevatt '
)tt' (
;tt( )
}uu 
catchvv 
(vv	 

	Exceptionvv
 
exvv 
)vv 
{ww 
returnxx 

InternalServerErrorxx 
(xx 
exxx !
)xx! "
;xx" #
}yy 
}zz 
[{{ 
HttpPut{{ 

]{{
 
[|| 
Route|| 
(|| 	
$str||	 
)|| 
]|| 
public~~ 
async~~	 
Task~~ 
<~~ 
IHttpActionResult~~ %
>~~% &
PutCambiarClave~~' 6
(~~6 7
UUsers~~7 =
usuario~~> E
)~~E F
{ 
try
ÄÄ 
{
ÅÅ 
string
ÇÇ 
#
enviarCorreoRecuperar
ÇÇ  
=
ÇÇ! "
new
ÇÇ# &
LIngresoLogin
ÇÇ' 4
(
ÇÇ4 5
)
ÇÇ5 6
.
ÇÇ6 7

nuevaClave
ÇÇ7 A
(
ÇÇA B
usuario
ÇÇB I
)
ÇÇI J
;
ÇÇJ K
if
ÉÉ 
(
ÉÉ #
enviarCorreoRecuperar
ÉÉ 
==
ÉÉ  
$str
ÉÉ! =
)
ÉÉ= >
{
ÑÑ 
return
ÖÖ 
Ok
ÖÖ 
(
ÖÖ #
enviarCorreoRecuperar
ÖÖ $
)
ÖÖ$ %
;
ÖÖ% &
}
ÜÜ 
return
áá 


BadRequest
áá 
(
áá 
$str
áá 5
)
áá5 6
;
áá6 7
}
àà 
catch
ââ 
(
ââ	 

	Exception
ââ
 
ex
ââ 
)
ââ 
{
ää 
return
ãã 
!
InternalServerError
ãã 
(
ãã 
ex
ãã !
)
ãã! "
;
ãã" #
}
åå 
}
çç 
}
éé 
}èè ù5
íC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Controllers\PacienteController.cs
	namespace 	
proyectoTEA
 
. 
Controllers !
{ 
[		 

EnableCors		 
(		 
origins		 
:		 
$str		 
,		 
headers		 "
:		" #
$str		$ '
,		' (
methods		) 0
:		0 1
$str		2 5
)		5 6
]		6 7
[ 
RoutePrefix 
( 
$str 
) 
] 
public 
class 
PacienteController  
:! "
ApiController# 0
{ 
[ 
Route 
( 	
$str	 
)  
]  !
[ 
HttpPut 

]
 
public 
IHttpActionResult	  
crearDocentePaciente /
(/ 0
UDocente0 8
uDocente9 A
)A B
{ 
string 	
message
 
; 
try 
{ 
message 
= 
new 
	LPaciente 
( 
) 
. "
enlazarDocentePaciente 4
(4 5
uDocente5 =
)= >
;> ?
switch 

( 
message 
) 
{ 
case 	
$str
 2
:2 3
return 
Conflict 
( 
) 
; 
case 	
$str
 
: 
return 
Ok 
( 
message 
) 
; 
case 	
$str
 0
:0 1
return 
Conflict 
( 
) 
; 
default 
: 
return 

BadRequest 
( 
message 
)  
;  !
}   
}!! 
catch"" 
(""	 

	Exception""
 
ex"" 
)"" 
{## 
message$$ 
=$$ 
$str$$ 
+$$ 
ex$$  "
;$$" #
return%% 


BadRequest%% 
(%% 
message%% 
)%% 
;%% 
}&& 
}'' 
[)) 
Route)) 
()) 	
$str))	 ,
))), -
]))- .
[** 
HttpGet** 

]**
 
public,, 
IHttpActionResult,,	 )
obtenerLosPacientesPorEnlazar,, 8
(,,8 9
int,,9 <
id,,= ?
),,? @
{-- 
string.. 	
message..
 
;.. 
try// 
{00 
return11 

Ok11 
(11 
new11 
	LPaciente11 
(11 
)11 
.11 (
obtenerEstudiantesPorEnlazar11 :
(11: ;
id11; =
)11= >
)11> ?
;11? @
}22 
catch33 
(33	 

	Exception33
 
ex33 
)33 
{44 
message55 
=55 
$str55 
+55 
ex55  "
;55" #
return66 


BadRequest66 
(66 
message66 
)66 
;66 
}77 
}88 
[99 
Route99 
(99 	
$str99	 )
)99) *
]99* +
[:: 
HttpPost:: 
]:: 
public<< 
IHttpActionResult<<	 &
obtenerLosPacientesEnlados<< 5
(<<5 6
int<<6 9
id<<: <
,<<< =
	UPaciente<<> G
tipoUsuario<<H S
)<<S T
{== 
string>> 	
message>>
 
;>> 
try?? 
{@@ 
returnAA 

OkAA 
(AA 
newAA 
	LPacienteAA 
(AA 
)AA 
.AA '
obtenerEstudiantesEnlazadosAA 9
(AA9 :
idAA: <
,AA< =
tipoUsuarioAA> I
)AAI J
)AAJ K
;AAK L
}BB 
catchCC 
(CC	 

	ExceptionCC
 
exCC 
)CC 
{DD 
messageEE 
=EE 
$strEE 
+EE 
exEE  "
;EE" #
returnFF 


BadRequestFF 
(FF 
messageFF 
)FF 
;FF 
}GG 
}HH 
[II 
RouteII 
(II 	
$strII	 
)II  
]II  !
[JJ 
HttpPutJJ 

]JJ
 
publicKK 
IHttpActionResultKK	 *
enlazarEstudianteConEstudianteKK 9
(KK9 :
	UPacienteKK: C
datosAEnlazarKKD Q
)KKQ R
{LL 
stringMM 	
messageMM
 
;MM 
tryNN 
{OO 
messagePP 
=PP 
newPP 
	LPacientePP 
(PP 
)PP 
.PP  
enlazarConEstudiantePP 2
(PP2 3
datosAEnlazarPP3 @
)PP@ A
;PPA B
returnQQ 

OkQQ 
(QQ 
messageQQ 
)QQ 
;QQ 
}RR 
catchSS 
(SS	 

	ExceptionSS
 
exSS 
)SS 
{TT 
messageUU 
=UU 
$strUU 
+UU 
exUU  "
;UU" #
returnVV 


BadRequestVV 
(VV 
messageVV 
)VV 
;VV 
}WW 
}XX 
[ZZ 
RouteZZ 
(ZZ 	
$strZZ	 
)ZZ 
]ZZ 
[[[ 
HttpPut[[ 

][[
 
public\\ 
IHttpActionResult\\	 
eliminarEnlace\\ )
(\\) *
	UPaciente\\* 3"
datosParaElminarEnlace\\4 J
)\\J K
{]] 
string^^ 	
message^^
 
;^^ 
try__ 
{`` 
messageaa 
=aa 
newaa 
	LPacienteaa 
(aa 
)aa 
.aa 
eliminarEnlaceaa ,
(aa, -"
datosParaElminarEnlaceaa- C
)aaC D
;aaD E
returnbb 

Okbb 
(bb 
messagebb 
)bb 
;bb 
}cc 
catchdd 
(dd	 

	Exceptiondd
 
exdd 
)dd 
{ee 
messageff 
=ff 
$strff 
+ff 
exff  "
;ff" #
returngg 


BadRequestgg 
(gg 
messagegg 
)gg 
;gg 
}hh 
}ii 
}kk 
}ll x
èC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Controllers\UsersController.cs
	namespace 	
proyectoTEA
 
. 
Controllers !
{ 
[ 

EnableCors 
( 
origins 
: 
$str 
, 
headers "
:" #
$str$ '
,' (
methods) 0
:0 1
$str2 5
)5 6
]6 7
[ 
RoutePrefix 
( 
$str 
) 
] 
public 
class 
UsersController 
: 
ApiController  -
{ 
[ 
Route 
( 	
$str	 
)  
]  !
[ 
HttpPost 
] 
public 
IHttpActionResult	  
PostAgregarAcudiente /
(/ 0

UAcudiente0 :
nuevoAcudiente; I
)I J
{ 
string 	
message
 
; 
try 
{ 
message 
= 
new 
LUserRegistercs !
(! "
)" #
.# $#
agregarUsuarioAcudiente$ ;
(; <
nuevoAcudiente< J
)J K
;K L
switch 

( 
message 
) 
{ 
case 	
$str
 "
:" #
return 
Conflict 
( 
) 
; 
case   	
$str  
  
:    !
return!! 
Ok!! 
(!! 
message!! 
)!! 
;!! 
default"" 
:"" 
return## 

BadRequest## 
(## 
message## 
)##  
;##  !
}$$ 
}%% 
catch&& 
(&&	 

	Exception&&
 
ex&& 
)&& 
{'' 
message(( 
=(( 
$str(( 
+(( 
ex((  "
;((" #
return)) 


BadRequest)) 
()) 
message)) 
))) 
;)) 
}** 
}++ 
[-- 
Route-- 
(-- 	
$str--	 
)-- 
]-- 
[.. 
HttpPost.. 
].. 
public// 
async//	 
Task// 
<// 
IHttpActionResult// %
>//% &
PostAgregarDocente//' 9
(//9 :
UDocente//: B
nuevoDocente//C O
)//O P
{00 
string11 	
message11
 
;11 
UTokenCompra22 
validacionCompra22  
=22! "
new22# &
UTokenCompra22' 3
(223 4
)224 5
;225 6
try33 
{44 
validacionCompra55 
=55 
await55 
new55  
LUserRegistercs55! 0
(550 1
)551 2
.552 3
obtenerDatosCompra553 E
(55E F
nuevoDocente55F R
.55R S
	Documento55S \
)55\ ]
;55] ^
if66 
(66 
validacionCompra66 $
==66$ &
null66& *
)66* +
{77 
return88 

BadRequest88 
(88 
$str88 J
)88J K
;88K L
}99 
else99 	
if99
 
(99 
validacionCompra99 
!=99 !
null99" &
)99& '
{:: 
message;; 
=;; 
new;; 
LUserRegistercs;; "
(;;" #
);;# $
.;;$ %!
agregarUsuarioDocente;;% :
(;;: ;
nuevoDocente;;; G
);;G H
;;;H I
switch<< 
(<< 
message<< 
)<< 
{== 
case>> 

$str>> #
:>># $
return?? 
Conflict?? 
(?? 
)?? 
;?? 
case@@ 

$str@@ !
:@@! "
returnAA 
OkAA 
(AA 
messageAA 
)AA 
;AA 
defaultBB 
:BB 
returnCC 

BadRequestCC 
(CC 
)CC 
;CC 
}DD 
}EE 
elseFF 
{GG 
returnHH 

BadRequestHH 
(HH 
)HH 
;HH 
}II 
}JJ 
catchKK 
(KK	 

	ExceptionKK
 
exKK 
)KK 
{LL 
messageMM 
=MM 
$strMM 
+MM 
exMM  "
;MM" #
returnNN 


BadRequestNN 
(NN 
)NN 
;NN 
}OO 
}PP 
[RR 
RouteRR 
(RR 	
$strRR	 
)RR 
]RR  
[SS 
HttpPostSS 
]SS 
publicTT 
IHttpActionResultTT	 
PostAgregarPacienteTT .
(TT. /
	UPacienteTT/ 8
nuevoPacienteTT9 F
)TTF G
{UU 
stringVV 	
messageVV
 
;VV 
tryWW 
{XX 
messageYY 
=YY 
newYY 
LUserRegistercsYY !
(YY! "
)YY" #
.YY# $"
agregarUsuarioPacienteYY$ :
(YY: ;
nuevoPacienteYY; H
)YYH I
;YYI J
switchZZ 

(ZZ 
messageZZ 
)ZZ 
{[[ 
case\\ 	
$str\\
 "
:\\" #
return]] 
Conflict]] 
(]] 
)]] 
;]] 
case^^ 	
$str^^
  
:^^  !
return__ 
Ok__ 
(__ 
message__ 
)__ 
;__ 
case`` 	
$str``
 6
:``6 7
returnaa 

BadRequestaa 
(aa 
messageaa 
)aa  
;aa  !
defaultbb 
:bb 
returncc 

BadRequestcc 
(cc 
)cc 
;cc 
}dd 
}ee 
catchff 
(ff	 

	Exceptionff
 
exff 
)ff 
{gg 
messagehh 
=hh 
$strhh 
+hh 
exhh  "
;hh" #
returnii 


BadRequestii 
(ii 
)ii 
;ii 
}jj 
}kk 
[oo 
Routeoo 
(oo 	
$stroo	 
)oo 
]oo 
[pp 
HttpGetpp 

]pp
 
publicqq 
asyncqq	 
Taskqq 
<qq 
IHttpActionResultqq %
>qq% &
GetDatosAcudienteqq' 8
(qq8 9
stringqq9 ?
cedulaEqq@ G
)qqG H
{rr 

UAcudientess 
	acudientess 
=ss 
newss 

UAcudientess (
(ss( )
)ss) *
;ss* +
tryuu 
{vv 
	acudienteww 
=ww 
awaitww 
newww 
LUserRegistercsww )
(ww) *
)ww* +
.ww+ ,!
obtenerDatosAcudienteww, A
(wwA B
cedulaEwwB I
)wwI J
;wwJ K
returnyy 

Okyy 
(yy 
	acudienteyy 
)yy 
;yy 
}zz 
catch{{ 
({{	 

	Exception{{
 
ex{{ 
){{ 
{|| 
return}} 

InternalServerError}} 
(}} 
ex}} !
)}}! "
;}}" #
}~~ 
} 
[
ÇÇ 
Route
ÇÇ 
(
ÇÇ 	
$str
ÇÇ	 
)
ÇÇ 
]
ÇÇ 
[
ÉÉ 
HttpGet
ÉÉ 

]
ÉÉ
 
public
ÑÑ 
async
ÑÑ	 
Task
ÑÑ 
<
ÑÑ 
IHttpActionResult
ÑÑ %
>
ÑÑ% &
GetDatosDocente
ÑÑ' 6
(
ÑÑ6 7
string
ÑÑ7 =
cedulaE
ÑÑ> E
)
ÑÑE F
{
ÖÖ 
UDocente
ÜÜ 
	acudiente
ÜÜ 
=
ÜÜ 
new
ÜÜ 
UDocente
ÜÜ $
(
ÜÜ$ %
)
ÜÜ% &
;
ÜÜ& '
try
àà 
{
ââ 
	acudiente
ää 
=
ää 
await
ää 
new
ää 
LUserRegistercs
ää )
(
ää) *
)
ää* +
.
ää+ ,!
obtenerDatosDocente
ää, ?
(
ää? @
cedulaE
ää@ G
)
ääG H
;
ääH I
return
åå 

Ok
åå 
(
åå 
	acudiente
åå 
)
åå 
;
åå 
}
çç 
catch
éé 
(
éé	 

	Exception
éé
 
ex
éé 
)
éé 
{
èè 
return
êê 
!
InternalServerError
êê 
(
êê 
ex
êê !
)
êê! "
;
êê" #
}
ëë 
}
íí 
[
ïï 
Route
ïï 
(
ïï 	
$str
ïï	 ,
)
ïï, -
]
ïï- .
[
ññ 
HttpGet
ññ 

]
ññ
 
public
óó 
async
óó	 
Task
óó 
<
óó 
IHttpActionResult
óó %
>
óó% &
datosPaciente
óó' 4
(
óó4 5
string
óó5 ;
documentoPaciente
óó< M
)
óóM N
{
òò 
	UPaciente
ôô 
paciente
ôô 
=
ôô 
new
ôô 
	UPaciente
ôô %
(
ôô% &
)
ôô& '
;
ôô' (
try
õõ 
{
úú 
paciente
ùù 
=
ùù 
await
ùù 
new
ùù 
LUserRegistercs
ùù (
(
ùù( )
)
ùù) *
.
ùù* +"
obtenerDatosPaciente
ùù+ ?
(
ùù? @
documentoPaciente
ùù@ Q
)
ùùQ R
;
ùùR S
return
üü 

Ok
üü 
(
üü 
paciente
üü 
)
üü 
;
üü 
}
†† 
catch
°° 
(
°°	 

	Exception
°°
 
ex
°° 
)
°° 
{
¢¢ 
return
££ 
!
InternalServerError
££ 
(
££ 
ex
££ !
)
££! "
;
££" #
}
§§ 
}
•• 
[
ßß 
Route
ßß 
(
ßß 	
$str
ßß	 $
)
ßß$ %
]
ßß% &
[
®® 
HttpPut
®® 

]
®®
 
public
©© 
IHttpActionResult
©©	 '
PutActualizarDatosDocente
©© 4
(
©©4 5
UDocente
©©5 =
uDocente
©©> F
)
©©F G
{
™™ 
string
´´ 	
message
´´
 
;
´´ 
try
¨¨ 
{
≠≠ 
message
ÆÆ 
=
ÆÆ 
new
ÆÆ 
LUserRegistercs
ÆÆ !
(
ÆÆ! "
)
ÆÆ" #
.
ÆÆ# $"
putActualizarDocente
ÆÆ$ 8
(
ÆÆ8 9
uDocente
ÆÆ9 A
)
ÆÆA B
;
ÆÆB C
return
ØØ 

Ok
ØØ 
(
ØØ 
message
ØØ 
)
ØØ 
;
ØØ 
}
∞∞ 
catch
±± 
(
±±	 

	Exception
±±
 
ex
±± 
)
±± 
{
≤≤ 
return
≥≥ 


BadRequest
≥≥ 
(
≥≥ 
$str
≥≥ 2
+
≥≥3 4
ex
≥≥5 7
.
≥≥7 8
Message
≥≥8 ?
.
≥≥? @
ToString
≥≥@ H
(
≥≥H I
)
≥≥I J
)
≥≥J K
;
≥≥K L
}
¥¥ 
}
µµ 
[
∂∂ 
Route
∂∂ 
(
∂∂ 	
$str
∂∂	 &
)
∂∂& '
]
∂∂' (
[
∑∑ 
HttpPut
∑∑ 

]
∑∑
 
public
∏∏ 
IHttpActionResult
∏∏	 )
PutActualizarDatosAcudiente
∏∏ 6
(
∏∏6 7

UAcudiente
∏∏7 A
acudienteNuevo
∏∏B P
)
∏∏P Q
{
ππ 
string
∫∫ 	
message
∫∫
 
;
∫∫ 
try
ªª 
{
ºº 
message
ΩΩ 
=
ΩΩ 
new
ΩΩ 
LUserRegistercs
ΩΩ !
(
ΩΩ! "
)
ΩΩ" #
.
ΩΩ# $$
putActualizarAcudiente
ΩΩ$ :
(
ΩΩ: ;
acudienteNuevo
ΩΩ; I
)
ΩΩI J
;
ΩΩJ K
return
ææ 

Ok
ææ 
(
ææ 
message
ææ 
)
ææ 
;
ææ 
}
øø 
catch
¿¿ 
(
¿¿	 

	Exception
¿¿
 
ex
¿¿ 
)
¿¿ 
{
¡¡ 
return
¬¬ 


BadRequest
¬¬ 
(
¬¬ 
$str
¬¬ 2
+
¬¬3 4
ex
¬¬5 7
.
¬¬7 8
Message
¬¬8 ?
.
¬¬? @
ToString
¬¬@ H
(
¬¬H I
)
¬¬I J
)
¬¬J K
;
¬¬K L
}
√√ 
}
ƒƒ 
[
≈≈ 
Route
≈≈ 
(
≈≈ 	
$str
≈≈	 %
)
≈≈% &
]
≈≈& '
[
∆∆ 
HttpPut
∆∆ 

]
∆∆
 
public
«« 
IHttpActionResult
««	 (
PutActualizarDatosPaciente
«« 5
(
««5 6
	UPaciente
««6 ?
	uPaciente
««@ I
)
««I J
{
»» 
string
…… 	
message
……
 
;
…… 
try
   
{
ÀÀ 
message
ÃÃ 
=
ÃÃ 
new
ÃÃ 
LUserRegistercs
ÃÃ !
(
ÃÃ! "
)
ÃÃ" #
.
ÃÃ# $#
putActualizarPaciente
ÃÃ$ 9
(
ÃÃ9 :
	uPaciente
ÃÃ: C
)
ÃÃC D
;
ÃÃD E
return
ÕÕ 

Ok
ÕÕ 
(
ÕÕ 
message
ÕÕ 
)
ÕÕ 
;
ÕÕ 
}
ŒŒ 
catch
œœ 
(
œœ	 

	Exception
œœ
 
ex
œœ 
)
œœ 
{
–– 
return
—— 


BadRequest
—— 
(
—— 
$str
—— 2
+
——3 4
ex
——5 7
.
——7 8
Message
——8 ?
.
——? @
ToString
——@ H
(
——H I
)
——I J
)
——J K
;
——K L
}
““ 
}
”” 
[
’’ 
Route
’’ 
(
’’ 	
$str
’’	 /
)
’’/ 0
]
’’0 1
[
÷÷ 
HttpPost
÷÷ 
]
÷÷ 
public
◊◊ 
IHttpActionResult
◊◊	 $
PostAgregarTokenCompra
◊◊ 1
(
◊◊1 2
UDocente
◊◊2 : 
datosDocenteCompra
◊◊; M
)
◊◊M N
{
ÿÿ 
bool
ŸŸ  
confirmacionCompra
ŸŸ 
=
ŸŸ 
false
ŸŸ "
;
ŸŸ" #
try
⁄⁄ 
{
€€  
confirmacionCompra
‹‹ 
=
‹‹ 
new
‹‹ 
LUserRegistercs
‹‹ ,
(
‹‹, -
)
‹‹- .
.
‹‹. /!
registroTokenCompra
‹‹/ B
(
‹‹B C 
datosDocenteCompra
‹‹C U
)
‹‹U V
;
‹‹V W
return
›› 

Ok
›› 
(
››  
confirmacionCompra
››  
)
››  !
;
››! "
}
ﬁﬁ 
catch
ﬂﬂ 
(
ﬂﬂ	 

	Exception
ﬂﬂ
 
ex
ﬂﬂ 
)
ﬂﬂ 
{
‡‡ 
string
·· 

message
·· 
=
·· 
$str
·· $
+
··% &
ex
··' )
;
··) *
return
‚‚ 


BadRequest
‚‚ 
(
‚‚ 
)
‚‚ 
;
‚‚ 
}
„„ 
}
‰‰ 
}
ÁÁ 
}ËË Œ
êC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Controllers\ValuesController.cs
	namespace

 	
proyectoTEA


 
.

 
Controllers

 !
{ 
public 
class 
ValuesController 
:  
ApiController! .
{ 
public 
IEnumerable	 
< 
string 
> 
Get  
(  !
)! "
{ 
return 	
new
 
string 
[ 
] 
{ 
$str !
,! "
$str# +
}, -
;- .
} 
public 
string	 
Get 
( 
int 
id 
) 
{ 
return 	
$str
 
; 
} 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str !
)! "
]" #
public 
IHttpActionResult  
validacionDB! -
(- .
). /
{ 	
try 
{ 
return   
Ok   
(   
new   

LActividad   (
(  ( )
)  ) *
.  * +
listaEnteros  + 7
(  7 8
)  8 9
)  9 :
;  : ;
}!! 
catch"" 
("" 
	Exception"" 
e"" 
)"" 
{## 
return$$ 


BadRequest$$ 
($$ 
e$$ 
.$$ 
Message$$ 
)$$  
;$$  !
}%% 
}&& 	
public)) 
void)) 
Post)) 
()) 
[)) 
FromBody)) "
]))" #
string))# )
value))* /
)))/ 0
{** 
}++ 
public.. 
void..	 
Put.. 
(.. 
int.. 
id.. 
,.. 
[.. 
FromBody.. #
]..# $
string..$ *
value..+ 0
)..0 1
{// 
}00 
public33 
void33	 
Delete33 
(33 
int33 
id33 
)33 
{44 
}55 
}66 
}77 ﬂ

C:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Global.asax.cs
	namespace

 	
proyectoTEA


 
{ 
public 
class 
WebApiApplication 
:  !
System" (
.( )
Web) ,
., -
HttpApplication- <
{ 
	protected 
void 
Application_Start "
(" #
)# $
{ 
AreaRegistration 
. 
RegisterAllAreas $
($ %
)% &
;& '
GlobalConfiguration 
. 
	Configure  
(  !
WebApiConfig! -
.- .
Register. 6
)6 7
;7 8
FilterConfig 
. !
RegisterGlobalFilters %
(% &
GlobalFilters& 3
.3 4
Filters4 ;
); <
;< =
RouteConfig 
. 
RegisterRoutes 
( 

RouteTable (
.( )
Routes) /
)/ 0
;0 1
BundleConfig 
. 
RegisterBundles 
(  
BundleTable  +
.+ ,
Bundles, 3
)3 4
;4 5
} 
} 
} ∑
ãC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 

AssemblyTitle 
( 
$str &
)& '
]' (
[		 
assembly		 	
:			 

AssemblyDescription		 
(		 
$str		 !
)		! "
]		" #
[

 
assembly

 	
:

	 
!
AssemblyConfiguration

  
(

  !
$str

! #
)

# $
]

$ %
[ 
assembly 	
:	 

AssemblyCompany 
( 
$str 
) 
] 
[ 
assembly 	
:	 

AssemblyProduct 
( 
$str (
)( )
]) *
[ 
assembly 	
:	 

AssemblyCopyright 
( 
$str 0
)0 1
]1 2
[ 
assembly 	
:	 

AssemblyTrademark 
( 
$str 
)  
]  !
[ 
assembly 	
:	 

AssemblyCulture 
( 
$str 
) 
] 
[ 
assembly 	
:	 


ComVisible 
( 
false 
) 
] 
[ 
assembly 	
:	 

Guid 
( 
$str 6
)6 7
]7 8
["" 
assembly"" 	
:""	 

AssemblyVersion"" 
("" 
$str"" $
)""$ %
]""% &
[## 
assembly## 	
:##	 

AssemblyFileVersion## 
(## 
$str## (
)##( )
]##) *⁄$
åC:\Users\asant\OneDrive\Escritorio\Andres Bernal\proyectos\proyectoTEAServicios\proyectoTEAServicios\proyectoTEA\Seguridad\TokenGenerator.cs
	namespace 	
proyectoTEA
 
. 
	Seguridad 
{ 
public 

class 
TokenGenerator 
{ 
public 
static 
string  
GenerateTokenJwt! 1
(1 2
UUsers2 8
user9 =
)= >
{ 
var 
audienceToken !
=" # 
ConfigurationManager$ 8
.8 9
AppSettings9 D
[D E
$strE Y
]Y Z
;Z [
var 
issuerToken 
=  ! 
ConfigurationManager" 6
.6 7
AppSettings7 B
[B C
$strC U
]U V
;V W
var 
	secretKey 
=  
ConfigurationManager  4
.4 5
AppSettings5 @
[@ A
$strA Q
]Q R
;R S
var 
securityKey 
=  !
new" % 
SymmetricSecurityKey& :
(: ;
System; A
.A B
TextB F
.F G
EncodingG O
.O P
DefaultP W
.W X
GetBytesX `
(` a
	secretKeya j
)j k
)k l
;l m
var 
signingCredentials &
=' (
new) ,
SigningCredentials- ?
(? @
securityKey@ K
,K L
SecurityAlgorithmsM _
._ `
HmacSha256Signature` s
)s t
;t u
ClaimsIdentity 
claimsIdentity -
=. /
new0 3
ClaimsIdentity4 B
(B C
newC F
[F G
]G H
{I J
new 
Claim 
( 
$str #
,# $
user% )
.) *
	Documento* 3
)3 4
,4 5
new 
Claim 
( 
$str 
,  
user! %
.% &
Rol_id& ,
., -
ToString- 5
(5 6
)6 7
)7 8
}   
)   
;   
var## 
tokenHandler##  
=##! "
new### &
System##' -
.##- .
IdentityModel##. ;
.##; <
Tokens##< B
.##B C
Jwt##C F
.##F G#
JwtSecurityTokenHandler##G ^
(##^ _
)##_ `
;##` a
var$$ 
jwtSecurityToken$$ $
=$$% &
tokenHandler$$' 3
.$$3 4"
CreateJwtSecurityToken$$4 J
($$J K
audience%% 
:%% 
audienceToken%% +
,%%+ ,
issuer&& 
:&& 
issuerToken&& '
,&&' (
subject'' 
:'' 
claimsIdentity'' +
,''+ ,
	notBefore(( 
:(( 
DateTime(( '
.((' (
Now((( +
,((+ ,
expires)) 
:)) 
DateTime)) %
.))% &
Now))& )
.))) *

AddMinutes))* 4
())4 5
$num))5 7
)))7 8
,))8 9
signingCredentials** &
:**& '
signingCredentials**( :
)**: ;
;**; <
var,, 
jwtTokenString,, "
=,,# $
tokenHandler,,% 1
.,,1 2

WriteToken,,2 <
(,,< =
jwtSecurityToken,,= M
),,M N
;,,N O

LoginToken.. 
token..  
=..! "
new..# &

LoginToken..' 1
(..1 2
)..2 3
;..3 4
token// 
.// 
FechaGenerado// #
=//$ %
DateTime//& .
.//. /
Now/// 2
;//2 3
token00 
.00 
FechaVigencia00 #
=00$ %
DateTime00& .
.00. /
Now00/ 2
.002 3

AddMinutes003 =
(00= >
$num00> @
)00@ A
;00A B
token11 
.11 
User_id11 
=11 
user11  $
.11$ %
Id11% '
;11' (
token22 
.22 
Token22 
=22 
jwtTokenString22 ,
;22, -
new33 
LIngresoLogin33 !
(33! "
)33" #
.33# $
guardarToken33$ 0
(330 1
token331 6
)336 7
;337 8
return44 
jwtTokenString44 %
;44% &
}55 
}77 
}88 