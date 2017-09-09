## Menu中on-select的使用

```html
  <Menu :theme="theme" width='auto' @on-select='selectMenu'>
    <Submenu v-for="(menu, key) in menus" :name="menu.name">
        <template slot="title">
            <Icon type="ios-paper"></Icon>
            {{menu.title}}
        </template>
        <MenuItem  v-for="item in menu.menuItems" :name="item.name" >{{item.title}}</MenuItem>
    </Submenu>
  </Menu>
```

```javascript
export default {
  data () {
    return {
    }
  },
  methods: {
    selectMenu(ele){
      console.log(ele)
    },
    updateOpened(ele){
      console.log(ele)
    },
    updateActiveName(ele){
      console.log(ele)
    }
  }
}
```
