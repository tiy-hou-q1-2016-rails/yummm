var RecipeList = React.createClass({

  autoUpdatingInterval: null,

  getInitialState(){
    return {
      recipes: []
    }
  },

  componentWillMount(){
    var component = this;
    component.fetchRecipes()
    this.autoUpdatingInterval = setInterval(function(){
      component.fetchRecipes()
    }, 3000)
  },

  componentWillUnMount(){
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
      {this.state.recipes.map(function(recipe){

        var cardStyle = {
          background: "url('" + recipe.photo_url + "')",
          backgroundSize: 'cover'
        };

        var cardClasses = "recipe " + recipe.category.name.toLowerCase() + " card-square mdl-card mdl-shadow--2dp"

        return <div key={recipe.id} className={cardClasses}>
          <div className="mdl-card__title mdl-card--expand" style={cardStyle} >
            <h2 className="mdl-card__title-text">{recipe.name}</h2>
          </div>
          <div className="mdl-card__supporting-text">
            {recipe.description} - {recipe.view_count}
          </div>
          <div className="mdl-card__actions mdl-card--border">
            <a href={recipe.recipe_url} className="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">{recipe.name}</a>
          </div>
        </div>

      })}

    </div>

    ;
  }
});
