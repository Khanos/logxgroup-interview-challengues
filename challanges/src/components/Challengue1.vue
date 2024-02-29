<script setup>
import { ref } from "vue";

const msg = ref("Hello World")
</script>

<template>
  <div>
    <h1 class="message">{{ msg }}</h1>
  </div>
</template>

<style scoped>
.flex {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.message {
  font-size: 1.8rem;
  color: white;
}
</style>

