document.addEventListener('DOMContentLoaded', function() {
    const slides = document.querySelectorAll('.slide');
    const nextButton = document.querySelector('.next');
    const prevButton = document.querySelector('.prev');
    let currentSlide = 0;

    function showSlide(index) {
        slides.forEach((slide, i) => {
            slide.classList.remove('active');
            if (i === index) {
                slide.classList.add('active');
            }
        });
        const offset = -index * 100;
        document.querySelector('.carousel').style.transform = `translateX(${offset}%)`;
    }

    nextButton.addEventListener('click', () => {
        currentSlide = (currentSlide + 1) % slides.length;
        showSlide(currentSlide);
    });

    prevButton.addEventListener('click', () => {
        currentSlide = (currentSlide - 1 + slides.length) % slides.length;
        showSlide(currentSlide);
    });

    setInterval(() => {
        currentSlide = (currentSlide + 1) % slides.length;
        showSlide(currentSlide);
    }, 5000); 
});


document.addEventListener('DOMContentLoaded', function() {
    const testimonials = document.querySelectorAll('.testimonial');
    let currentTestimonial = 0;

    function showTestimonial(index) {
        testimonials.forEach((testimonial, i) => {
            testimonial.classList.remove('active');
            if (i === index) {
                testimonial.classList.add('active');
            }
        });
    }

    function nextTestimonial() {
        currentTestimonial = (currentTestimonial + 1) % testimonials.length;
        showTestimonial(currentTestimonial);
    }

    setInterval(nextTestimonial, 5000);
});



document.addEventListener('DOMContentLoaded', async function() {
    const productGrid = document.querySelector('.product-grid');

    
    async function fetchFeaturedProducts() {
        try {
            const response = await fetch('http://localhost:3000/api/products'); 
            const products = await response.json();
            displayFeaturedProducts(products);
        } catch (error) {
            console.error('Error fetching featured products:', error);
        }
    }

    
    function displayFeaturedProducts(products) {
        productGrid.innerHTML = ''; 
        products.slice(0, 4).forEach(product => { 
            const productCard = document.createElement('div');
            productCard.classList.add('product-card');

            productCard.innerHTML = `
                <div class="product-image">
                    <img src="${product.images[0]}" alt="${product.name}">
                    <div class="quick-view">
                        <a href="product-detail.html" class="quick-view-button">Quick View</a>
                    </div>
                </div>
                <h3>${product.name}</h3>
                <p class="price">$${product.price.toFixed(2)}</p>
                <a href="product-detail.html" class="buy-button">Buy Now</a>
            `;

            productGrid.appendChild(productCard);
        });
    }

  
    await fetchFeaturedProducts();
});


