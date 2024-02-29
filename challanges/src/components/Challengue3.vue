<script setup lang='ts'>
import {ref } from 'vue';
interface UseCounterOptions {
  min?: number
  max?: number
}

/**
 * Implement the composable function
 * 1. inc (+)
 * 2. dec (-)
 * 3. reset 
 * 4. min & max opotion support
 * Make sure the function works correctly
*/
function useCounter(initialValue = 0, options: UseCounterOptions = {}) {
  const min = ref(options.min);
  const max = ref(options.max);
  const count = ref(initialValue);

  function inc(){
    console.log('inc: ', count.value)
    if(count.value === max.value) return;
    return count.value++
  }

  function dec(){
    console.log('dec: ', count.value)
    if(count.value === min.value) return;
    return count.value--;
  }

  function reset(){
    count.value = initialValue;
  }

  return {count, inc, dec, reset};
}

const { count, inc, dec, reset } = useCounter(0, { min: 0, max: 10 })

</script>

<template>
  <div>
    <h2>Hello from Challengue 3</h2>
    <h1>{{ count }}</h1>
    <hr class="my-4">
    <div>
      <button class="btn-counter" @click="inc">+</button>
      <button class="btn-counter" @click="dec">-</button>
    </div>
    <hr class="my-2">
    <div>
      <button class="btn-counter" @click="reset">Reset</button>
    </div>
  </div>
</template>

<style scoped>
.btn-counter{
  margin: 1rem;
  padding: 1rem;
  font-size: 1.8rem;
}
.my-4{
  margin-top: 2rem;
  margin-bottom: 2rem;
}
</style>
