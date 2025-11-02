// Initialize lightbox on page load
document.addEventListener("DOMContentLoaded", function () {
  const lightbox = document.getElementById("lightbox");

  // Add click handlers to all photo gallery images
  document.querySelectorAll(".photo-gallery img").forEach(function (img) {
    img.addEventListener("click", function () {
      lightbox.style.display = "flex";
      document.getElementById("lightbox-img").src = this.src;
    });
  });

  // Close lightbox when clicking the X button
  document.querySelector(".lightbox-close").addEventListener("click", function () {
    lightbox.style.display = "none";
  });

  // Close lightbox when clicking outside the image
  lightbox.addEventListener("click", function (e) {
    if (e.target === this) {
      this.style.display = "none";
    }
  });

  // Close lightbox when pressing Escape key
  document.addEventListener("keydown", function (e) {
    if (e.key === "Escape" && lightbox.style.display === "flex") {
      lightbox.style.display = "none";
    }
  });
});
