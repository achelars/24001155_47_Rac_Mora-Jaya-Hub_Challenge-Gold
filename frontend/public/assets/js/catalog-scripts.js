document.addEventListener('DOMContentLoaded', async function() {
    const productGrid = document.getElementById('product-grid');
    const categoryLinks = document.querySelectorAll('.category-list li a');
    const priceRangeInput = document.getElementById('price-range');
    const priceRangeValue = document.getElementById('price-range-value');
    const materialFilter = document.getElementById('material');
    const searchInput = document.getElementById('search');
    const sortSelect = document.getElementById('sort-options');

    let products = [];


    async function fetchProducts() {
        try {
            const response = await fetch('http://localhost:3000/api/products');
            products = await response.json();
            displayProducts(products);
        } catch (error) {
            console.error('Error fetching products:', error);
        }
    }


    function displayProducts(productsToDisplay) {
        productGrid.innerHTML = ''; 
        productsToDisplay.forEach(product => {
            const productCard = document.createElement('div');
            productCard.classList.add('product-card');
            productCard.setAttribute('data-material', product.material);
            productCard.setAttribute('data-category', product.category);

            productCard.innerHTML = `
                <img src="${product.images[0]}" alt="${product.name}">
                <h3>${product.name}</h3>
                <p class="price">$${product.price.toFixed(2)}</p>
                <p class="description">${product.description}</p>
                <a href="product-detail.html" class="cta-button">View Details</a>
            `;

            productGrid.appendChild(productCard);
        });
    }


    function filterProducts() {
        const selectedCategory = document.querySelector('.category-list li a.active')?.textContent.toLowerCase() || 'all';
        const selectedPrice = parseInt(priceRangeInput.value);
        const selectedMaterial = materialFilter.value.toLowerCase();
        const searchQuery = searchInput.value.toLowerCase();

        let filteredProducts = products.filter(product => {
            const matchesCategory = selectedCategory === 'all' || product.category.toLowerCase() === selectedCategory;
            const matchesPrice = product.price <= selectedPrice;
            const matchesMaterial = selectedMaterial === 'all' || product.material.toLowerCase() === selectedMaterial;
            const matchesSearch = product.name.toLowerCase().includes(searchQuery) || product.description.toLowerCase().includes(searchQuery);

            return matchesCategory && matchesPrice && matchesMaterial && matchesSearch;
        });

        sortProducts(filteredProducts);
    }

 
    function sortProducts(filteredProducts) {
        const sortOption = sortSelect.value;

        if (sortOption === 'low-high') {
            filteredProducts.sort((a, b) => a.price - b.price);
        } else if (sortOption === 'high-low') {
            filteredProducts.sort((a, b) => b.price - a.price);
        } else if (sortOption === 'name-asc') {
            filteredProducts.sort((a, b) => a.name.localeCompare(b.name));
        } else if (sortOption === 'name-desc') {
            filteredProducts.sort((a, b) => b.name.localeCompare(a.name));
        }

        displayProducts(filteredProducts);
    }


    categoryLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            categoryLinks.forEach(link => link.classList.remove('active'));
            this.classList.add('active');
            filterProducts();
        });
    });

    priceRangeInput.addEventListener('input', () => {
        priceRangeValue.textContent = `$0 - $${priceRangeInput.value}`;
        filterProducts();
    });

    materialFilter.addEventListener('change', filterProducts);
    searchInput.addEventListener('input', filterProducts);
    sortSelect.addEventListener('change', () => sortProducts(products));

    
    await fetchProducts();
});
