var RecipeForm = React.createClass({

  getInitialState(){
    return {
      errors: {},
      categories: []
    }
  },

  componentDidMount(){
    this.fetchCategories()
  },

  fetchCategories(){
    var component = this;

    fetch("/api/categories.json")
    .then(function(response){
      return response.json();
    })
    .then(function(json){
      component.setState({
        categories: json.categories
      })
    })
  },

  handleSubmit(event){
    event.preventDefault();

    var component = this;

    var params = {
      recipe: {
        name: this.refs.name.value,
        method: this.refs.method.value,
        description: this.refs.description.value,
        ingredients: this.refs.ingredients.value,
        category_id: this.refs.category.value,
        photo_url: this.refs.photo_url.value
      }
    }

    fetch("/api/recipes.json", {
      method: 'post',
      headers: {
       "Content-type": "application/json"
     },
      body: JSON.stringify(params)
    }).then(function(response){

      console.log(response)

      return response.json();

    }).then(function(data){
      console.log(data)

      if (data.errors){
        component.setState({
          errors: data.errors
        })
      } else {
        // alert("😇")
        window.location = "/recipes"
      }
    })
  },

  render: function() {
    return <div>
      <h1>New Recipe</h1>



      <form id="new_recipe" onSubmit={this.handleSubmit}>

      <div>

        <label htmlFor="name">Name</label>
        <input type="text" ref="name" id="name"/><em>{this.state.errors.name}</em>
      </div>

      <div>
        <label htmlFor="ingredients">Ingredients</label>
        <input type="text" ref="ingredients" id="ingredients"/><em>{this.state.errors.ingredients}</em>
      </div>

      <div>
        <label htmlFor="method">Method</label>
        <input type="text" ref="method" id="method"/><em>{this.state.errors.method}</em>
      </div>

      <div>
        <label htmlFor="description">Description</label>
        <input type="text" ref="description" id="description"/><em>{this.state.errors.description}</em>
      </div>

      <div>
        <label htmlFor="category">Category</label>

        <select ref="category" id="category">
          <option value="">Please select a category</option>

          {this.state.categories.map(function(category){
            return <option key={category.id} value={category.id}>{category.name}</option>
          })}
        </select>

        <em>{this.state.errors.category}</em>

      </div>

      <div>
        <label htmlFor="photo_url">Photo Url</label>
        <input type="text" ref="photo_url" id="photo_url"/><em>{this.state.errors.photo}</em>
      </div>

      <div>
        <button className="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">Create Recipe</button>
      </div>

      </form>


    </div>;
  }
});
