document.addEventListener("DOMContentLoaded", () => {
  const moviesDiv = document.getElementById("movies");
  const movieSelect = document.getElementById("movie");
  const bookingForm = document.getElementById("bookingForm");
  const summaryDiv = document.getElementById("summary");

  // Load movies from backend API
  fetch('/api/movies')
    .then(response => {
      if (!response.ok) throw new Error('Failed to fetch movies');
      return response.json();
    })
    .then(movies => {
      moviesDiv.innerHTML = '';
      movieSelect.innerHTML = '<option value="">Select a movie</option>';
    
      movies.forEach(movie => {
        // Display movie details
        const movieDiv = document.createElement("div");
        movieDiv.textContent = `${movie.name} - ${movie.genre} - ${movie.language} - Rating: ${movie.rating}`;
        moviesDiv.appendChild(movieDiv);
    
        // Populate dropdown
        const option = document.createElement("option");
        option.value = movie.id;
        option.textContent = movie.name;
        movieSelect.appendChild(option);
      });
    })
    .catch(error => {
      moviesDiv.textContent = `Error loading movies: ${error.message}`;
    });

  bookingForm.addEventListener("submit", event => {
    event.preventDefault();

    const name = document.getElementById("name").value.trim();
    const email = document.getElementById("email").value.trim();
    const movieId = movieSelect.value;
    const seats = parseInt(document.getElementById("seats").value, 10);

    if (!name || !email || !movieId || !seats) {
      alert("Please fill in all fields.");
      return;
    }

    // Simple email validation
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
      alert("Please enter a valid email address.");
      return;
    }

    const bookingData = { name, email, movieId, seats };

    fetch('/api/bookings', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(bookingData)
    })
    .then(response => {
      if (!response.ok) return response.json().then(data => { throw new Error(data.error || 'Booking failed'); });
      return response.json();
    })
    .then(data => {
      const booking = data.booking;
      summaryDiv.innerHTML = `
        <p><strong>Name:</strong> ${booking.name}</p>
        <p><strong>Email:</strong> ${booking.email}</p>
        <p><strong>Movie:</strong> ${booking.movie}</p>
        <p><strong>Tickets:</strong> ${booking.seats}</p>
        <p><em>Booking confirmed! Thank you for booking with us.</em></p>
      `;
      bookingForm.reset();
    })
    .catch(error => {
      alert(error.message);
    });
  });
});
