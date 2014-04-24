" Vim syntax file :)
" Language:	BOA(Binary)
" Maintainer:	Kenneth Harvey <kenny@harveyserv.ath.cx>
" Last Change:	2011 May 1

" Quit if another syntax was already loaded
if exists("b:current_syntax")
  finish
endif

" Show tabs and other junk as escapes
set invlist

" Try to clear funky junk
syn clear SpecialKey
hi clear SpecialKey

" Some instructions
syn region	BBmakeVarT	matchgroup=BBinstruction start="[\o023][abcdfinos]" matchgroup=BBvar end="[pev]." skip="[abcdfinos]" nextgroup=@BBval
    hi def link BBmakeVarT BBtype
syn region	BBaddFieldT	matchgroup=BBinstruction start="[\o025]" matchgroup=BBtype end="[abcdfinos]" skip="[pev]." nextgroup=@BBval
    hi def link BBaddFieldT BBvar
syn region	BBdefFunc	matchgroup=BBinstruction start="[\o032]f.[abcdfinos]" matchgroup=BBinstruction end="[\o032]" skip="[^\o032]*" contains=ALL
    hi def link BBinstruction Conditional

" Generic value
syn cluster	BBval		contains=BBvar,@BBliteral

" Keyword matches
syn match	BBtype		"[abcdfinos]" | hi def link BBtype Type
syn match	BBvar		"[pev]." | hi def link BBvar Identifier

" Literals
syn match	BBnull		"n." | hi def link BBnull Constant
syn match	BBint		"i...." | hi def link BBint Constant
syn match	BBfloat		"d...." | hi def link BBfloat Constant
syn match	BBbool		"b[\o000\o001]" | hi def link BBbool Constant
syn region	BBstring	matchgroup=BBstringStart start="s" matchgroup=BBstringEnd end="\_." skip="[\o000-\o399]" contains=BBstring001,BBstring002,BBstring003,BBstring004,BBstring005,BBstring006,BBstring007,BBstring008,BBstring009,BBstring010,BBstring011,BBstring012,BBstring013,BBstring014,BBstring015,BBstring016,BBstring017,BBstring018,BBstring019,BBstring020,BBstring021,BBstring022,BBstring023,BBstring024,BBstring025,BBstring026,BBstring027,BBstring028,BBstring029,BBstring030,BBstring031,BBstring032,BBstring033,BBstring034,BBstring035,BBstring036,BBstring037,BBstring038,BBstring039,BBstring040,BBstring041,BBstring042,BBstring043,BBstring044,BBstring045,BBstring046,BBstring047,BBstring048,BBstring049,BBstring050,BBstring051,BBstring052,BBstring053,BBstring054,BBstring055,BBstring056,BBstring057,BBstring058,BBstring059,BBstring060,BBstring061,BBstring062,BBstring063,BBstring064,BBstring065,BBstring066,BBstring067,BBstring068,BBstring069,BBstring070,BBstring071,BBstring072,BBstring073,BBstring074,BBstring075,BBstring076,BBstring077,BBstring078,BBstring079,BBstring080,BBstring081,BBstring082,BBstring083,BBstring084,BBstring085,BBstring086,BBstring087,BBstring088,BBstring089,BBstring090,BBstring091,BBstring092,BBstring093,BBstring094,BBstring095,BBstring096,BBstring097,BBstring098,BBstring099 extend
    hi def link BBstring PreProc
    hi def link BBstringStart Constant
    hi def link BBstringEnd PreProc

" Strings
syn match	BBstring001	"[\o000][\o000][\o001]" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring001 BBString
syn match	BBstring002	"[\o000][\o000][\o002]\_.\{1}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring002 BBString
syn match	BBstring003	"[\o000][\o000][\o003]\_.\{2}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring003 BBString
syn match	BBstring004	"[\o000][\o000][\o004]\_.\{3}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring004 BBString
syn match	BBstring005	"[\o000][\o000][\o005]\_.\{4}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring005 BBString
syn match	BBstring006	"[\o000][\o000][\o006]\_.\{5}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring006 BBString
syn match	BBstring007	"[\o000][\o000][\o007]\_.\{6}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring007 BBString
syn match	BBstring008	"[\o000][\o000][\o010]\_.\{7}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring008 BBString
syn match	BBstring009	"[\o000][\o000][\o011]\_.\{8}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring009 BBString
syn match	BBstring010	"[\o000][\o000][\o012]\_.\{9}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring010 BBString
syn match	BBstring011	"[\o000][\o000][\o013]\_.\{10}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring011 BBString
syn match	BBstring012	"[\o000][\o000][\o014]\_.\{11}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring012 BBString
syn match	BBstring013	"[\o000][\o000][\o015]\_.\{12}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring013 BBString
syn match	BBstring014	"[\o000][\o000][\o016]\_.\{13}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring014 BBString
syn match	BBstring015	"[\o000][\o000][\o017]\_.\{14}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring015 BBString
syn match	BBstring016	"[\o000][\o000][\o020]\_.\{15}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring016 BBString
syn match	BBstring017	"[\o000][\o000][\o021]\_.\{16}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring017 BBString
syn match	BBstring018	"[\o000][\o000][\o022]\_.\{17}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring018 BBString
syn match	BBstring019	"[\o000][\o000][\o023]\_.\{18}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring019 BBString
syn match	BBstring020	"[\o000][\o000][\o024]\_.\{19}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring020 BBString
syn match	BBstring021	"[\o000][\o000][\o025]\_.\{20}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring021 BBString
syn match	BBstring022	"[\o000][\o000][\o026]\_.\{21}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring022 BBString
syn match	BBstring023	"[\o000][\o000][\o027]\_.\{22}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring023 BBString
syn match	BBstring024	"[\o000][\o000][\o030]\_.\{23}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring024 BBString
syn match	BBstring025	"[\o000][\o000][\o031]\_.\{24}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring025 BBString
syn match	BBstring026	"[\o000][\o000][\o032]\_.\{25}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring026 BBString
syn match	BBstring027	"[\o000][\o000][\o033]\_.\{26}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring027 BBString
syn match	BBstring028	"[\o000][\o000][\o034]\_.\{27}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring028 BBString
syn match	BBstring029	"[\o000][\o000][\o035]\_.\{28}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring029 BBString
syn match	BBstring030	"[\o000][\o000][\o036]\_.\{29}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring030 BBString
syn match	BBstring031	"[\o000][\o000][\o037]\_.\{30}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring031 BBString
syn match	BBstring032	"[\o000][\o000][\o040]\_.\{31}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring032 BBString
syn match	BBstring033	"[\o000][\o000][\o041]\_.\{32}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring033 BBString
syn match	BBstring034	"[\o000][\o000][\o042]\_.\{33}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring034 BBString
syn match	BBstring035	"[\o000][\o000][\o043]\_.\{34}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring035 BBString
syn match	BBstring036	"[\o000][\o000][\o044]\_.\{35}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring036 BBString
syn match	BBstring037	"[\o000][\o000][\o045]\_.\{36}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring037 BBString
syn match	BBstring038	"[\o000][\o000][\o046]\_.\{37}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring038 BBString
syn match	BBstring039	"[\o000][\o000][\o047]\_.\{38}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring039 BBString
syn match	BBstring040	"[\o000][\o000][\o050]\_.\{39}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring040 BBString
syn match	BBstring041	"[\o000][\o000][\o051]\_.\{40}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring041 BBString
syn match	BBstring042	"[\o000][\o000][\o052]\_.\{41}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring042 BBString
syn match	BBstring043	"[\o000][\o000][\o053]\_.\{42}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring043 BBString
syn match	BBstring044	"[\o000][\o000][\o054]\_.\{43}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring044 BBString
syn match	BBstring045	"[\o000][\o000][\o055]\_.\{44}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring045 BBString
syn match	BBstring046	"[\o000][\o000][\o056]\_.\{45}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring046 BBString
syn match	BBstring047	"[\o000][\o000][\o057]\_.\{46}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring047 BBString
syn match	BBstring048	"[\o000][\o000][\o060]\_.\{47}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring048 BBString
syn match	BBstring049	"[\o000][\o000][\o061]\_.\{48}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring049 BBString
syn match	BBstring050	"[\o000][\o000][\o062]\_.\{49}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring050 BBString
syn match	BBstring051	"[\o000][\o000][\o063]\_.\{50}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring051 BBString
syn match	BBstring052	"[\o000][\o000][\o064]\_.\{51}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring052 BBString
syn match	BBstring053	"[\o000][\o000][\o065]\_.\{52}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring053 BBString
syn match	BBstring054	"[\o000][\o000][\o066]\_.\{53}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring054 BBString
syn match	BBstring055	"[\o000][\o000][\o067]\_.\{54}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring055 BBString
syn match	BBstring056	"[\o000][\o000][\o070]\_.\{55}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring056 BBString
syn match	BBstring057	"[\o000][\o000][\o071]\_.\{56}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring057 BBString
syn match	BBstring058	"[\o000][\o000][\o072]\_.\{57}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring058 BBString
syn match	BBstring059	"[\o000][\o000][\o073]\_.\{58}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring059 BBString
syn match	BBstring060	"[\o000][\o000][\o074]\_.\{59}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring060 BBString
syn match	BBstring061	"[\o000][\o000][\o075]\_.\{60}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring061 BBString
syn match	BBstring062	"[\o000][\o000][\o076]\_.\{61}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring062 BBString
syn match	BBstring063	"[\o000][\o000][\o077]\_.\{62}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring063 BBString
syn match	BBstring064	"[\o000][\o000][\o100]\_.\{63}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring064 BBString
syn match	BBstring065	"[\o000][\o000][\o101]\_.\{64}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring065 BBString
syn match	BBstring066	"[\o000][\o000][\o102]\_.\{65}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring066 BBString
syn match	BBstring067	"[\o000][\o000][\o103]\_.\{66}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring067 BBString
syn match	BBstring068	"[\o000][\o000][\o104]\_.\{67}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring068 BBString
syn match	BBstring069	"[\o000][\o000][\o105]\_.\{68}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring069 BBString
syn match	BBstring070	"[\o000][\o000][\o106]\_.\{69}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring070 BBString
syn match	BBstring071	"[\o000][\o000][\o107]\_.\{70}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring071 BBString
syn match	BBstring072	"[\o000][\o000][\o100]\_.\{71}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring072 BBString
syn match	BBstring073	"[\o000][\o000][\o101]\_.\{72}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring073 BBString
syn match	BBstring074	"[\o000][\o000][\o102]\_.\{73}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring074 BBString
syn match	BBstring075	"[\o000][\o000][\o103]\_.\{74}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring075 BBString
syn match	BBstring076	"[\o000][\o000][\o104]\_.\{75}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring076 BBString
syn match	BBstring077	"[\o000][\o000][\o105]\_.\{76}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring077 BBString
syn match	BBstring078	"[\o000][\o000][\o106]\_.\{77}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring078 BBString
syn match	BBstring079	"[\o000][\o000][\o107]\_.\{78}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring079 BBString
syn match	BBstring080	"[\o000][\o000][\o100]\_.\{79}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring080 BBString
syn match	BBstring081	"[\o000][\o000][\o101]\_.\{80}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring081 BBString
syn match	BBstring082	"[\o000][\o000][\o102]\_.\{81}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring082 BBString
syn match	BBstring083	"[\o000][\o000][\o103]\_.\{82}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring083 BBString
syn match	BBstring084	"[\o000][\o000][\o104]\_.\{83}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring084 BBString
syn match	BBstring085	"[\o000][\o000][\o105]\_.\{84}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring085 BBString
syn match	BBstring086	"[\o000][\o000][\o106]\_.\{85}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring086 BBString
syn match	BBstring087	"[\o000][\o000][\o107]\_.\{86}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring087 BBString
syn match	BBstring088	"[\o000][\o000][\o100]\_.\{87}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring088 BBString
syn match	BBstring089	"[\o000][\o000][\o101]\_.\{88}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring089 BBString
syn match	BBstring090	"[\o000][\o000][\o102]\_.\{89}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring090 BBString
syn match	BBstring091	"[\o000][\o000][\o103]\_.\{90}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring091 BBString
syn match	BBstring092	"[\o000][\o000][\o104]\_.\{91}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring092 BBString
syn match	BBstring093	"[\o000][\o000][\o105]\_.\{92}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring093 BBString
syn match	BBstring094	"[\o000][\o000][\o106]\_.\{93}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring094 BBString
syn match	BBstring095	"[\o000][\o000][\o107]\_.\{94}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring095 BBString
syn match	BBstring096	"[\o000][\o000][\o140]\_.\{95}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring096 BBString
syn match	BBstring097	"[\o000][\o000][\o141]\_.\{96}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring097 BBString
syn match	BBstring098	"[\o000][\o000][\o142]\_.\{97}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring098 BBString
syn match	BBstring099	"[\o000][\o000][\o143]\_.\{98}" containedin=BBstring,BBinstruction contains=NONE extend | hi def link BBstring099 BBString
