function calculateTotal() {
    const movie = document.getElementById("movie");
    const seats = document.getElementById("seats").value;
    const price = movie.value;
    const total = seats * price;

    document.getElementById("total").textContent = `Total Price: ₹${total}`;
}
