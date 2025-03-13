
# 武汉大学物理科学与技术学院本科生毕业论文模板

## 参考文献格式更改

需要更改bst文件中output相关的函数，具体例子为`gbt7714-2005-whu-numerical.bst`中932到936行我所更改的内容

```
is.in.chinese {                             
    "\zihao{-4}\songti " write$
    } {                                           
      "\zihao{-4}\fontspec{Times New Roman} \bfseries " write$
    } if$
             

```
