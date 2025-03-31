new Vue({
  el: '#app',
  data() {
      return {
          circleUrl: "./pic/me.jpeg",
          centerDialogVisible: false,

      };
  },

  methods: {
      navigateTo(page) {
          window.location.href = page;
      },
  }
})

