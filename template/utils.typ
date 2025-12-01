// =================================================================
// 工具函数模块
// 提供常用的辅助函数和组件
// =================================================================

// --- 辅助函数：不编号的章节标题 ---
// 用于引言、结论等不需要编号的章节
// 用法：#unnumbered-chapter("引言")
#let unnumbered-chapter(title) = {
  heading(level: 1, numbering: none)[#title]
}

// --- 辅助函数：表格内容包装器 ---
// 为表格内容应用特定的样式（小五号字体、单倍行距）
// 用法：#table-content[ #table(...) ]
#let table-content(body) = {
  set text(size: 9pt)  // 小五
  set par(leading: 0.65em)  // 单倍行距
  set align(center)
  body
}

// --- 辅助函数：图片内容包装器 ---
// 为图片内容应用居中对齐
// 用法：#image-content[ #image(...) ]
#let image-content(body) = {
  set align(center)
  body
}

// --- 辅助函数：垂直间距 ---
// 快速插入固定的垂直间距
#let vspace(height) = {
  v(height)
}

// --- 辅助函数：水平分隔线 ---
// 插入一条水平分隔线
#let horizontal-line(
  width: 100%, 
  thickness: 0.5pt, 
  color: black
) = {
  line(length: width, stroke: thickness + color)
}

// --- 辅助函数：下划线文本框 ---
// 创建带下划线的文本框（常用于封面字段）
#let underlined-box(
  content,
  width: 100%,
  stroke-width: 0.5pt,
  bottom-padding: 4pt,
) = {
  box(
    width: width, 
    stroke: (bottom: stroke-width + black), 
    inset: (bottom: bottom-padding)
  )[
    #align(left)[#content]
  ]
}

// --- 辅助函数：创建简单目录 ---
// 自定义目录样式
#let simple-outline(
  title: [目录],
  depth: 2,
) = {
  align(center)[
    #outline(
      title: title, 
      depth: depth, 
      indent: 0em
    )
  ]
}

// --- 辅助函数：页面分隔 ---
// 插入分页符并清除浮动
#let new-page() = {
  pagebreak()
}

// --- 辅助函数：隐藏内容（用于占位） ---
// 用于在视觉上创建空白但保持对齐
#let placeholder(content) = {
  hide(content)
}

// --- 辅助函数：文本居中块 ---
#let centered(body) = {
  align(center)[#body]
}

// --- 辅助函数：文本左对齐块 ---
#let left-aligned(body) = {
  align(left)[#body]
}

// --- 辅助函数：文本右对齐块 ---
#let right-aligned(body) = {
  align(right)[#body]
}
