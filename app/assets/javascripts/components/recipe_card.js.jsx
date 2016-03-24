var RecipeCard = React.createClass({

  render(){

    var recipe = this.props.recipe;

    var cardClasses = "recipe " + recipe.category.name.toLowerCase() + " card-square mdl-card mdl-shadow--2dp"

    return <div className={cardClasses}>
      <RecipeCardTitle recipe={recipe} />

      <div className="mdl-card__supporting-text">
        {recipe.description} - {recipe.view_count}
      </div>
      <div className="mdl-card__actions mdl-card--border">
        <a href={recipe.recipe_url} className="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">{recipe.name}</a>
      </div>
    </div>

  }
})
