
# 导读
```
modules 模块化同时使用 
namespaced 使用命名空间 
```

## 坑，为什么使用模块化同时还需要命名空间？ 
``` 
使用modules getter可以在指定模块下取得。
但commit去触发一个方法时就会出问题，如果两个模块有同名的mutations则都会被触发。为了解决这个问题需要开启命名空间
```


## 简单示意
``` javascript

const backpath = {
  namespaced: true,
  state: {
    list: []
  },
  mutations: {
    push(state, item) {
      console.log(item, '=======', state)
      state.list.push(item);
      return state.list;
    },
    ... ... 略
  }
}

const store = new vuex.Store({
  modules: {
    menu,
    backpath
  }
})


import { mapState } from '../../../static/vendor/vuex/vuex.js';


// 取得 backpath.list
computed: mapState({
  list: (state) => state.backpath.list,
}),
... ... 略
    

// 触发方法 
created(){
  this.$store.commit('backpath/push', {
    title: 'index', name: 'spider'
  })
}
... ... 略

```

