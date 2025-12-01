// =================================================================
// 封面设计模块
// 用于生成标准格式的报告封面
// =================================================================

#import "config.typ": *

// =================================================================
// 封面设计函数
// =================================================================

#let cover-design(
  title: "",        // 封面标题（支持使用 \ 换行）
  info-items: (),   // 信息字段列表，格式：(("标签：", "值"), ...)
) = {
  // --- 页面设置 ---
  set page(
    paper: "a4",
    margin: (
      top: page-config.margin-top,
      bottom: page-config.margin-bottom,
      left: page-config.margin-left,
      right: page-config.margin-right,
    )
  )

  // --- 顶部留白 ---
  v(cover-config.title-top-spacing)

  // --- 封面标题（居中，黑体一号，加粗）---
  align(center)[
    #text(
      font: cover-config.title-font,
      size: cover-config.title-size,
      weight: "bold",
    )[#title]
  ]

  // --- 标题与信息区域间留白 ---
  v(cover-config.title-bottom-spacing)

  // --- 信息填写区域（Grid 布局）---
  align(center)[
    #grid(
      columns: (auto, cover-config.field-underline-width),
      row-gutter: cover-config.field-row-gap,
      align: (left + horizon, left + horizon),

      // 遍历传入的信息项
      ..info-items.map(item => {
        let label = item.at(0)
        let value = item.at(1)

        (
          // 左侧：标签（黑体三号）
          text(
            font: cover-config.label-font,
            size: cover-config.label-size,
          )[#label],
          
          // 右侧：带下划线的值（仿宋三号）
          box(
            width: 100%,
            stroke: (bottom: 0.5pt + black),
            inset: (bottom: 4pt),
          )[
            #align(left)[
              #text(
                font: cover-config.value-font,
                size: cover-config.value-size,
              )[#value]
            ]
          ]
        )
      }).flatten()
    )
  ]

  // --- 底部填充 ---
  v(1fr)
}