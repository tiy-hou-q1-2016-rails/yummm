var RecipeList = React.createClass({

  autoUpdatingInterval: null,

  getInitialState(){
    return {
      recipes: []
    }
  },

  componentDidMount(){
    var component = this;
    component.fetchRecipes()
    this.autoUpdatingInterval = setInterval(function(){
      component.fetchRecipes()
    }, 3000)
  },

  componentWillUnmount(){
    // Clear the interval
    clearInterval(this.autoUpdatingInterval)
  },

  fetchRecipes(){
    var component = this;
    fetch("/api/recipes.json")
    .then(function(r){
      return r.json();
    })
    .then(function(json){
      component.setState({
        recipes: json.recipes
      })
    })
  },

  render: function() {
    return <div className="recipe-list">
      {this.state.recipes.map(function(theRecipe){
        return <RecipeCard key={theRecipe.id} recipe={theRecipe} />
      })}
    </div>

    ;
  }
});
