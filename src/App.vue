<template>
  <img alt="Cloudoor logo" src="./assets/circle.svg" width="320px" style="margin-bottom: 10px;">
  <img alt="Vue logo" src="./assets/logo.png">
  <HelloWorld :msg="'Welcome to your ' + name + ' application'"/>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'

export default {
  name: 'App',
  components: {
    HelloWorld
  },
  data(){
    return {
      name: process.env.VUE_APP_NAME
    }
  },
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
