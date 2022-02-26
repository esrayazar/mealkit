
const get_meal = document.getElementById('meal');

const change_meal_container = document.getElementById('change_meal');

get_meal.addEventListener('click', () => {
	fetch('https://www.themealdb.com/api/json/v1/1/random.php')
		.then(res => res.json())
		.then(res => {
			createMeal(res.meals[0]);
		})
		.catch(e => {
			console.warn(e);
		});
});

// const get_meal_btn = document.getElementById('get_meal');
// const meal_container = document.getElementById('meal');

const createMeal = meal => {
	const ingredients = [];

	// Get all ingredients from the object. Up to 20
	for (let i = 1; i <= 20; i++) {
		if (meal[`strIngredient${i}`]) {
			ingredients.push(
				`${meal[`strIngredient${i}`]} - ${meal[`strMeasure${i}`]}`
			);
		} else {
			// Stop if there are no more ingredients
			break;
		}
	}

	const newInnerHTML = `
		<div class="row">
			<div class="columns five">
				<img src="${change_meal.strMealThumb}" alt="Meal Image">
				${
					change_meal.strCategory
						? `<p><strong>Category:</strong> ${change_meal.strCategory}</p>`
						: ''
				}
				${change_meal.strArea ? `<p><strong>Area:</strong> ${change_meal.strArea}</p>` : ''}
				${
					change_meal.strTags
						? `<p><strong>Tags:</strong> ${change_meal.strTags
								.split(',')
								.join(', ')}</p>`
						: ''
				}
				<h5>Ingredients:</h5>
				<ul>
					${ingredients.map(ingredient => `<li>${ingredient}</li>`).join('')}
				</ul>
			</div>
			<div class="columns seven">
				<h4>${change_meal.strMeal}</h4>
				<p>${change_meal.strInstructions}</p>
			</div>
		</div>
		${
			change_meal.strYoutube
				? `
		<div class="row">
			<h5>Video Recipe</h5>
			<div class="videoWrapper">
				<iframe width="420" height="315" 
				src="https://www.youtube.com/embed/${change_meal.strYoutube.slice(-11)}">
				</iframe>
			</div>
		</div>`
				: ''
		}
	`;

	change_meal_container.innerHTML = newInnerHTML;
};