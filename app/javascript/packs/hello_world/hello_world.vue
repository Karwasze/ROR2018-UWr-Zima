<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: I18n.t('hello')
    }
  }
}
</script>

<style scoped>
p {
  font-size: 4em;
  text-align: center;
  font-family: 'Roboto', sans-serif;
}
</style>
