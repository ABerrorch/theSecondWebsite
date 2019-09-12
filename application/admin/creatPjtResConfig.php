<?php
/**
 * Created by PhpStorm.
 * User: Huan
 * Date: 2019/9/4
 * Time: 12:41
 */

/**
 * @param $name
 * @param $
 * @param $container
 * @param string $type
 * @return array
 */
function defCatalog($name,$type = "DIR",$container = null){
    if(!isset($container)){
        $container = [
            defCatalog("manageA","FUN",[])
        ];
    }
    assert(is_array($container));
    assert(is_string($name));
    assert($type == "DIR" || $type == "FUN");
    return [
        "name"=>$name,
        "type"=>$type,
        "container"=>$container,
    ];
}

# 这些是一般情况下的几种常用项
# PDF COMPRESS
$manageAPC = [
    defCatalog("manageA","FUN",["text"=>"<h3>需上传PDF/压缩包</h3>"])
];
# PDF WORD
$manageAPW = [
    defCatalog("manageA","FUN",["text"=>"<h3>需上传PDF/word</h3>"])
];
# PDF WORD Shao miao
$manageAPWS = [
    defCatalog("manageA","FUN",["text"=>"<h3>需上传PDF/word/扫描件</h3>"])
];
# Jin Er
$manageAJE = [
    defCatalog("manageA","FUN",[
        "text"=>
            "<h3>需上传PDF/word/扫描件</h3>" .
            "<h1><div style=\"color:#F00\">请在说明中著明金额</div></h1>"
        ]
    )
];
# Shen Xiang
$manageASX = [
    defCatalog("manageA","FUN",
        [
            "text"=>
            "<h3>材料包括以下几类<h3>" .
            "党和国家领导人以及上级机关视察、检查专项（项目、课题）工作时形成的声像材料<br>" .
            "召开各类重要会议和重要活动形成的声像材料<br>" .
            "院士、著名科学家、知名人士在重大活动中形成的声像材料<br>" .
            "组织或参加的重要外事活动形成的声像材料等<br>" .
            "集体或个人获得的奖牌、奖杯、奖状的声像材料<br>"
        ]
    )
];
# 这些是会议管理的常用项
$manageB = [
    defCatalog("manageB","FUN",[
        "text"=>"<h3>需上传PDF/压缩包</h3>",
        "typeOfFile"=>"['会议通知','会议签到表','汇报PPT','会议纪要','会议照片']",
        ])
];

//print_r($manageAPC);

$Project = defCatalog("项目管理","DIR",[
    defCatalog("组织管理文件"),
    defCatalog("课题管理","DIR",[
        defCatalog("manageResearch","FUN",[])
    ]),
    defCatalog("科研文件","DIR",[
        defCatalog("研究准备阶段","DIR",[
            defCatalog("课题任务书","DIR",$manageAPC),
            defCatalog("实施协议","DIR",$manageAPC),
            defCatalog("技术合同","DIR",$manageAPC),
        ]),
        defCatalog("研究实施阶段","DIR",[
            defCatalog("工作计划和总结","DIR",$manageAPW),
            defCatalog("研究数据/报告/实验记录等技术文档","DIR",$manageAPW),
        ]),
        defCatalog("研究验收阶段","DIR",[
            defCatalog("结题报告","DIR",$manageAPW),
            defCatalog("审计报告","DIR",$manageAPW),
            defCatalog("验收材料","DIR",$manageAPW),
        ]),
        defCatalog("研究成果材料","DIR",[
            defCatalog("论文专著、专利、评奖、第三方检测报告等科技成果","DIR",$manageAPWS),
            defCatalog("参观、考察、调研等资料","DIR",$manageAPWS),
            defCatalog("媒体宣传报道材料","DIR",$manageAPWS),
        ]),
    ]),
    defCatalog("会议文件","DIR",[
        defCatalog("2018年","DIR",[
            defCatalog("组内会议","DIR",$manageB),
        ]),
        defCatalog("2019年","DIR",[
            defCatalog("组内会议","DIR",$manageB),
        ]),
        defCatalog("2020年","DIR",[
            defCatalog("组内会议","DIR",$manageB),
        ]),
        defCatalog("2021年","DIR",[
            defCatalog("组内会议","DIR",$manageB),
        ]),
        defCatalog("2022年","DIR",[
            defCatalog("组内会议","DIR",$manageB),
        ]),
    ]),
    defCatalog("声像文件","DIR",[
            defCatalog("2018年","DIR",$manageASX),
            defCatalog("2019年","DIR",$manageASX),
            defCatalog("2020年","DIR",$manageASX),
            defCatalog("2021年","DIR",$manageASX),
            defCatalog("2022年","DIR",$manageASX ),
        ]
    ),
]);

###########################################################################################
###########################################################################################
$Research = defCatalog("课题管理","DIR",[
    defCatalog("组织管理文件(只读)","DIR",[
        defCatalog("readOnlyA","FUN",[
            "catalogPath"=>"project,0"
        ])
    ]),
    defCatalog("科研文件","DIR",[
        defCatalog("研究准备阶段","DIR",[
            defCatalog("课题任务书","DIR",$manageAPC),
            defCatalog("实施协议","DIR",$manageAPC),
            defCatalog("技术合同","DIR",$manageAPC),
        ]),
        defCatalog("研究实施阶段","DIR",[
            defCatalog("工作计划和总结","DIR",$manageAPW),
            defCatalog("研究数据/报告/实验记录等技术文档","DIR",$manageAPW),
        ]),
        defCatalog("研究验收阶段","DIR",[
            defCatalog("结题报告","DIR",$manageAPW),
            defCatalog("审计报告","DIR",$manageAPW),
            defCatalog("验收材料","DIR",$manageAPW),
        ]),
        defCatalog("研究成果材料","DIR",[
            defCatalog("论文专著、专利、评奖、第三方检测报告等科技成果","DIR",$manageAPWS),
            defCatalog("参观、考察、调研等资料","DIR",$manageAPWS),
            defCatalog("媒体宣传报道材料","DIR",$manageAPWS),
        ]),
    ]),
    defCatalog("会议文件","DIR",[
        defCatalog("2018年","DIR",[
            defCatalog("组内会议","DIR",$manageB),
            defCatalog("项目组会议(只读)","DIR",[
                defCatalog("readOnlyA","FUN",[
                    'catalogPath'=>"project,3,0,0"
                ])
            ])
        ]),
        defCatalog("2019年","DIR",[
            defCatalog("组内会议","DIR",$manageB),
            defCatalog("项目组会议","DIR",[
                defCatalog("readOnlyA","FUN",[
                    'catalogPath'=>"project,3,1,0"
                ])
            ])
        ]),
        defCatalog("2020年","DIR",[
            defCatalog("组内会议","DIR",$manageB),
            defCatalog("项目组会议","DIR",[
                defCatalog("readOnlyA","FUN",[
                    'catalogPath'=>"project,3,2,0"
                ])
            ])
        ]),
        defCatalog("2021年","DIR",[
            defCatalog("组内会议","DIR",$manageB),
            defCatalog("项目组会议","DIR",[
                defCatalog("readOnlyA","FUN",[
                    'catalogPath'=>"project,3,3,0"
                ])
            ])
        ]),
        defCatalog("2022年","DIR",[
            defCatalog("组内会议","DIR",$manageB),
            defCatalog("项目组会议","DIR",[
                defCatalog("readOnlyA","FUN",[
                    'catalogPath'=>"project,3,4,0"
                ])
            ])
        ]),
    ]),
    defCatalog("声像文件","DIR",[
        defCatalog("2018年","DIR",$manageASX),
        defCatalog("2019年","DIR",$manageASX),
        defCatalog("2020年","DIR",$manageASX),
        defCatalog("2021年","DIR",$manageASX),
        defCatalog("2022年","DIR",$manageASX),
    ]),
    defCatalog("经费执行文件","DIR",[
        defCatalog("设备费","DIR",[
            defCatalog("50万元以下设备","DIR",$manageAJE),
            defCatalog("50万元以上设备","DIR",$manageAJE)
        ]),
        defCatalog("材料费","DIR",$manageAJE),
        defCatalog("测试化验加工费","DIR",$manageAJE),
        defCatalog("燃料动力费","DIR",$manageAJE),
        defCatalog("差旅、会议、国际合作交流费","DIR",$manageAJE),
        defCatalog("出版、文献、信息传播、知识产权事务费","DIR",$manageAJE),
        defCatalog("专家咨询费","DIR",$manageAJE),
        defCatalog("其他支出","DIR",$manageAJE),
    ])

]);
$catalog = ["project"=>$Project,"research"=>$Research];

// 把PHP数组转成JSON字符串
$json_string = json_encode($catalog);

// 写入文件
file_put_contents('catalog.json', $json_string);

//print_r($Project);
print_r($manageB);
print_r($manageASX);
print_r($manageAJE);