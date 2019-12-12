class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show, :learn]

  def index


    


    
  
    if params[:query].present?
    
        param = params[:query]
        sql = "ingredients.name ilike '%#{param}%' or cocktails.name ilike '%#{param}%'"
        @cocktails = Cocktail.joins(:ingredients).where(sql).distinct()
        @result = "Liste des cocktails avec : #{param} "
    else
       @cocktails = Cocktail.all.order(:id)
       @result = "Liste de tous les cocktails"
    end

    if params[:get]
      if params[:get][:ig]

        list = []
        params[:get][:ig].each { |id| list << id.to_i if id != "" }
        array_name = []
        list.each { |id| array_name << Ingredient.find(id).name }


        # # on cherche tout les cocktails qui on élément qui n'est pas dans la liste 
        # # pour chaque élement dans la liste on test si il n'est pas dans les doses
        # sql = "doses.ingredient_id = #{list[0]} "

        # list.each do |id|
        #   sql += "or doses.ingredient_id != #{id} "
       
        # end

        @all = Cocktail.all
        @cocktails = []


        

        @all.each do |item|
          
          dosage = []

          item.ingredients.each do |x|
            dosage << x.id
          end
          
          if dosage.count > 0

       

            
            if in_list?(dosage, list)

              
              @cocktails << item 

            end
          end
          

          
        end

     


        @result = "Liste de tous les cocktails qui n'a pas un des ingrédients suivants :  #{array_name}"
        #@sql = sql
     
       
        end

    end



  end

  def in_list?(dosage, list) #test un des ingrédient de la liste n'est pas dans les dosages
    dosage.each do |item| #test si tout les element font parti de la liste
      puts "#{list} << #{item} #{list.include? item}" 
      
      unless list.include? item
        return false #pas dans la liste
      end
    end
    return true
  end

  

  # query /cocktails/1
  # GET /cocktails/1.json
  def show
  
  end

  # GET /cocktails/new
  def new
    @cocktail = Cocktail.new
  end

  # GET /cocktails/1/edit
  def edit
  end

  # POST /cocktails
  # POST /cocktails.json
  def create
    @cocktail = Cocktail.new(cocktail_params)

    respond_to do |format|
      if @cocktail.save
        format.html { redirect_to @cocktail, notice: 'Cocktail was successfully created.' }
        format.json { render :show, status: :created, location: @cocktail }
      else
        format.html { render :new }
        format.json { render json: @cocktail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cocktails/1
  # PATCH/PUT /cocktails/1.json
  def update
    respond_to do |format|
      if @cocktail.update(cocktail_params)
        format.html { redirect_to @cocktail, notice: 'Cocktail was successfully updated.' }
        format.json { render :show, status: :ok, location: @cocktail }
      else
        format.html { render :edit }
        format.json { render json: @cocktail.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @cocktail.destroy
    respond_to do |format|
      format.html { redirect_to cocktails_url, notice: 'Cocktail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def learn 
    card_list = []
    7.times { card_list << Cocktail.all.sample }
    @cards = card_list
  end 

  private

    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    def cocktail_params
      params.require(:cocktail).permit(:name, :photo, :description)
    end

   
end
