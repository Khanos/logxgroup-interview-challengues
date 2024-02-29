<script setup>
import { ref } from "vue";

const msg = ref("Hello World")
</script>

<template>
  <div class="flex">
    <h1 class="message">{{ msg }}</h1>
  </div>
</template>

<style scoped>
.flex {
  display: flex;
  justify-content: center;
  align-items: center;
}
.message {
  font-size: 1.8rem;
  color: white;
}
</style>

