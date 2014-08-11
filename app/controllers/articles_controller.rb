class ArticlesController < ApplicationController

    http_basic_authenticate_with name: "andyhelix", password: "qwerty",except: [:index, :show]
    
    def new
        @article = Article.new
    end

    def index
        @articles = Article.all
    end

    def create
        @article = Article.new(article_params)

        if @article.save
            redirect_to @article # 转到 show 动作
        else
            render 'new'
        end
        # 查看传递参数
    end

    def show
        @article = Article.find(params[:id])
        # 从请求中查找 :id 参数
        # TODO
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
            # 出错时 显示表单
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end


    private
        def article_params
            params.require(:article).permit(:title, :text)
        end

end
