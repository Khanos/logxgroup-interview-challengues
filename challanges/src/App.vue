<script setup>
// import HelloWorld from './components/HelloWorld.vue'
import Challengue1 from './components/Challengue1.vue'
import Challengue2 from './components/Challengue2.vue'
</script>

<template>
  <div class="container">
    <p>This is the first challengue</p>
    <Challengue1 />
  </div>
  <div class="container">
    <p>This is the Second challengue (writable-computed)</p>
    <Challengue2 />
  </div>
</template>

<style scoped>
.container{
  border: solid 2px white;
  margin: 5rem;
  padding: 5rem;
}
.logo {
  height: 6em;
  padding: 1.5em;
  will-change: filter;
  transition: filter 300ms;
}
.logo:hover {
  filter: drop-shadow(0 0 2em #646cffaa);
}
.logo.vue:hover {
  filter: drop-shadow(0 0 2em #42b883aa);
}
</style>
