# 写在前面的话
## 由于引入vue不是在window对象下导致的问题


## 引入vue-router后路由不生效
#### 错误方式 
``` javascript 
let vue = require('vue');
import vueRouter from './static/vendor/vue/vue-router.js';
```

#### 主要原因

  因为引入vue的方式一致导致的结果。
  
``` javascript 
if (inBrowser && window.Vue) {
  window.Vue.use(VueRouter);
}
```

由此可以需要手动使用 vue.use(vueRouter)



# 最终原码

``` javascript 
let vue = require('vue');
// 使用use使用 iviewui
import iviewui from './static/vendor/iview/iview.min.js';
vue.use(iviewui);


import axios from  './static/vendor/axios/axios.min.js';

// 工作路由
import  routes from './router.es';

import vueRouter from './static/vendor/vue/vue-router.js';
vue.use(vueRouter);

const router = new vueRouter({ routes } );

new vue({
  router
}).$mount('#app')
```


