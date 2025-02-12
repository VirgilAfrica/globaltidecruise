let SmoothScroll = {
    mounted() {
      this.el.querySelectorAll("a").forEach(link => {
        link.addEventListener("click", function (e) {
          const targetId = this.getAttribute("href").substring(1);
          const targetSection = document.getElementById(targetId);
          if (targetSection) {
            e.preventDefault();
            targetSection.scrollIntoView({ behavior: "smooth" });
          }
        });
      });
    }
  };
  
  export default SmoothScroll;
  