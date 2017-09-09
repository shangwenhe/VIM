

# 写在前面的话

## 由于 iviewui 中已经存在menu这个组件导致新增的局部组件不生效


## 错误示例
``` javascript 
import menu from '../admin/menu/menu.vue';

    export default {
      ... ...
      components:{
        menu
      }
    }

```



### 正确示例
``` javascript 
import adminMenu from '../admin/menu/menu.vue';

    export default {
      ... ...
      components:{
        adminMenu
      }
    }

```
