<script setup lang="ts">
import { ref, computed } from "vue"

const count = ref(0)
const plusOne = computed({
  get: () => count.value + 1,
  set: (val) => {
    count.value = count.value + val
  },
});

/**
 * Make the `plusOne` writable.
 * So that we can get the result `plusOne` to be 3, and `count` to be 2.
*/

plusOne.value++

</script>

<template>
  <div>
    <p>count: {{ count }}</p>
    <p>plusOne: {{ plusOne }}</p>
  </div>
</template>

