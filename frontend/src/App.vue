<template>
  <div id="app">
    <div class="container">
      <h1>Todo List Manager</h1>
      <h6>Powered by Vue | Vuex 4 | Axios | Ruby on Rails 6 | SQLite 3</h6>
      <AddTodo />
      <FilterTodos />
      <Todos />
    </div>
  </div>
</template>

<script>
import Todos from '@/components/Todos.vue';
import AddTodo from '@/components/AddTodo.vue';
import FilterTodos from '@/components/FilterTodos.vue'

export default {
  name: "App",
  components: {
    Todos,
    AddTodo,
    FilterTodos
  }
};
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

.container {
  max-width: 1100px;
  margin: auto;
  overflow: auto;
  padding: 0 2rem;
}
</style>
