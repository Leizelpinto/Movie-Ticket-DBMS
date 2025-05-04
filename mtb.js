const movies = [
  { id: 16, name: "Dangal", genre: "Biography", language: "Hindi", rating: 4.2 },
  { id: 17, name: "Baahubali: The Beginning", genre: "Action", language: "Telugu", rating: 4.0 },
  { id: 18, name: "3 Idiots", genre: "Comedy", language: "Hindi", rating: 4.8 },
  { id: 19, name: "Drishyam", genre: "Thriller", language: "Malayalam", rating: 4.8 },
  { id: 20, name: "PK", genre: "Comedy-Drama", language: "Hindi", rating: 4.6 }
];

const moviesDiv = document.getElementById("movies");
const movieSelect = document.getElementById("movie");
const bookingForm = document.getElementById("bookingForm");
const summaryDiv = document.getElementById("summary");

// Populate movies list and dropdown
movies.forEach(movie => {
  const movieDiv = document.createElement("div");
  movieDiv.textContent = `${movie.name} - ${movie.genre} - ${movie.language} - Rating: ${movie.rating}`;
  moviesDiv.appendChild(movieDiv);

  const option = document.createElement("option");
  option.value = movie.id;
  option.textContent = movie.name;
  movieSelect.appendChild(option);
});

// Handle booking form submission
bookingForm.addEventListener("submit", event => {
  event.preventDefault();

  const name = document.getElementById("name").value;
  const email = document.getElementById("email").value;
  const selectedMovie = movieSelect.options[movieSelect.selectedIndex].text;
  const seats = document.getElementById("seats").value;

  summaryDiv.innerHTML = `
    <p><strong>Name:</strong> ${name}</p>
    <p><strong>Email:</strong> ${email}</p>
    <p><strong>Movie:</strong> ${selectedMovie}</p>
    <p><strong>Tickets:</strong> ${seats}</p>
    <p>Thank you for booking with us!</p>
  `;

  bookingForm.reset();
});
