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
$PjtResBase = defCatalog("NULL","DIR",[
    defCatalog("科研文件","DIR",[
        defCatalog("研究准备阶段","DIR",[
            defCatalog("课题任务书"),
            defCatalog("实施协议"),
            defCatalog("技术合同"),
        ]),
    ]),
    defCatalog("会议文件","DIR",
        defCatalog("不同年份","DIR",[
            defCatalog("组内会议"),
        ])
    ),
    defCatalog("声像文件","DIR",[
        defCatalog("不同年份"),
    ]),
]);

$Project = defCatalog("Project","DIR",[
    defCatalog("组织管理文件"),
    defCatalog("课题管理","DIR",[
        defCatalog("manageResearch","FUN",[])
    ]),
    defCatalog("科研文件","DIR",[
        defCatalog("研究准备阶段","DIR",[
            defCatalog("课题任务书"),
            defCatalog("实施协议"),
            defCatalog("技术合同"),
        ]),
        defCatalog("研究实施阶段","DIR",[
            defCatalog("工作计划和总结"),
            defCatalog("研究数据/报告/实验记录等技术文档"),
        ]),
        defCatalog("研究验收阶段","DIR",[
            defCatalog("结题报告"),
            defCatalog("审计报告"),
            defCatalog("验收材料"),
        ]),
        defCatalog("研究成果材料","DIR",[
            defCatalog("专利专著等"),
            defCatalog("参观考察等"),
            defCatalog("媒体宣传等"),
        ]),
    ]),
    defCatalog("会议文件","DIR",[
        defCatalog("年份1","DIR",[
            defCatalog("组内会议"),
        ]),
    ]),
    defCatalog("声像文件","DIR",[
            defCatalog("年份1"),
        ]
    ),
]);

###########################################################################################
###########################################################################################
$Research = defCatalog("Project","DIR",[
    defCatalog("组织管理文件","DIR",[
        defCatalog("readOnly","FUN",[
            "catalogPath"=>"project,0"
        ])
    ]),
    defCatalog("科研文件","DIR",[
        defCatalog("研究准备阶段","DIR",[
            defCatalog("课题任务书"),
            defCatalog("实施协议"),
            defCatalog("技术合同"),
        ]),
        defCatalog("研究实施阶段","DIR",[
            defCatalog("工作计划和总结"),
            defCatalog("研究数据/报告/实验记录等技术文档"),
        ]),
        defCatalog("研究验收阶段","DIR",[
            defCatalog("结题报告"),
            defCatalog("审计报告"),
            defCatalog("验收材料"),
        ]),
        defCatalog("研究成果材料","DIR",[
            defCatalog("专利专著等"),
            defCatalog("参观考察等"),
            defCatalog("媒体宣传等"),
        ]),
    ]),
    defCatalog("会议文件","DIR",[
        defCatalog("年份1","DIR",[
            defCatalog("组内会议"),
            defCatalog("项目组会议","DIR",[
                defCatalog("readOnly","FUN",[
                    'catalogPath'=>"project,1,3,1"
                ])
            ])
        ]),
    ]),
    defCatalog("声像文件","DIR",[
        defCatalog("年份1"),
    ]),
    defCatalog("经费执行文件","DIR",[
        defCatalog("设备费","DIR",[
            defCatalog("50万元以下设备"),
            defCatalog("50万元以上设备")
        ]),
        defCatalog("材料费"),
        defCatalog("etc"),
    ])

]);
$catalog = ["project"=>$Project,"research"=>$Research];

// 把PHP数组转成JSON字符串
$json_string = json_encode($catalog);

// 写入文件
file_put_contents('catalog.json', $json_string);
