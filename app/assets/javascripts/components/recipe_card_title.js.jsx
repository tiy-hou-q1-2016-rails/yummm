var RecipeCardTitle = React.createClass({


  render(){

    var recipe = this.props.recipe;

    var cardStyle = {
      background: "url('" + recipe.photo_url + "')",
      backgroundSize: 'cover'
    };


    return <div className="mdl-card__title mdl-card--expand" style={cardStyle} >
      <h2 className="mdl-card__title-text">{recipe.name}</h2>
    </div>
  }
})
