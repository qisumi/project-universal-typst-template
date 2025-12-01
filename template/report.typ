// =================================================================
// 正文样式模块
// 定义报告的正文排版样式，包括标题、段落、图表等
// =================================================================

#import "config.typ": *
#import "utils.typ": *

// =================================================================
// 1. 页码设置函数
// =================================================================

// 页码 footer 内容
#let page-footer-content = context {
  let page-num = counter(page).get().first()
  if page-num == none {
    none
  } else {
    set text(
      font: page-number-config.font,
      size: page-number-config.size,
    )

    if page-number-config.alternate-position {
      // 启用奇偶页切换
      let is-odd = calc.rem(page-num, 2) == 1
      if is-odd {
        // 奇数页：页码在右侧
        align(right)[#page-num]
      } else {
        // 偶数页：页码在左侧
        align(left)[#page-num]
      }
    } else {
      // 固定位置
      let align-value = if page-number-config.default-align == "left" {
        left
      } else if page-number-config.default-align == "right" {
        right
      } else {
        center
      }
      align(align-value)[#page-num]
    }
  }
}

// 启用页码（从当前位置开始计数）
// 使用方式：#show: enable-page-number
#let enable-page-number(doc) = {
  // 重置页码从 1 开始
  counter(page).update(1)

  // 应用页面设置（包含页脚与页码）
  set page(
    paper: "a4",
    margin: (
      top: page-config.margin-top,
      bottom: page-config.margin-bottom,
      left: page-config.margin-left,
      right: page-config.margin-right,
    ),
    footer: page-footer-content,
  )

  doc
}

// =================================================================
// 2. 正文样式函数
// =================================================================

#let report-style(doc) = {
  // --- 基础文本设置 ---
  set text(
    font: fonts.main,
    size: font-sizes.xiaosi,
    lang: "zh",
    region: "cn",
  )

  // --- 段落设置 ---
  set par(
    leading: paragraph-config.line-height - font-sizes.xiaosi,
    first-line-indent: paragraph-config.indent,
    justify: true,
  )

  // --- 标题编号设置 ---
  set heading(numbering: heading-config.numbering)

  // --- 标题显示规则 ---
  show heading: it => {
    // 重置段落缩进
    set par(first-line-indent: 0pt)
    
    // 构造编号文本
    let number-text = if it.numbering != none {
      counter(heading).display(it.numbering) + h(0.5em)
    } else {
      none
    }

    // 根据级别应用样式
    let config = if it.level == 1 {
      heading-config.level1
    } else if it.level == 2 {
      heading-config.level2
    } else if it.level == 3 {
      heading-config.level3
    } else {
      heading-config.level4
    }

    set text(
      font: config.font,
      size: config.size,
      weight: config.weight,
    )
    
    block(
      above: config.spacing-above,
      below: config.spacing-below,
      sticky: true,
    )[
      #align(left)[#number-text #it.body]
    ]
  }

  // --- 图表标题设置 ---
  show figure.caption: it => {
    set text(
      font: figure-config.caption-font,
      size: figure-config.caption-size,
    )
    set align(figure-config.caption-align)
    set par(leading: paragraph-config.line-height - figure-config.caption-size)
    it
  }

  // --- 图表间距设置 ---
  show figure: it => {
    set align(center)

    if it.kind == table {
      block(
        above: figure-config.table-spacing-above,
        below: figure-config.table-spacing-below,
      )[#it]
    } else {
      block(
        above: figure-config.image-spacing-above,
        below: figure-config.image-spacing-below,
      )[#it]
    }
  }

  // 应用文档内容
  doc
}

// =================================================================
// 2. 辅助函数（向后兼容）
// =================================================================

// 不编号的章节标题
#let unnumbered-chapter(title) = {
  unnumbered-chapter(title)
}

// 表格内容包装器（向后兼容，保留旧名称）
#let tbl-content(body) = {
  table-content(body)
}

// 图片内容包装器（向后兼容，保留旧名称）
#let fig-content(body) = {
  image-content(body)
}
