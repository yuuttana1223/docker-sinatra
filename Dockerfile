# rubyのドッカーイメージをベースにする
FROM ruby:2.7

# 自分の作業をどこでやるか指定(何でも良い)
WORKDIR /var/www

# srcディレクトリを/var/wwwにコピー
COPY ./src /var/www

# dockerを起動させるコマンド
# Gemfileの中身のライブラリをインストールするディレクトリのpathを設定
# RUN bundle config --local set path 'vendor/bundle'
# RUN bundle install
RUN bundle config --local set path 'vendor/bundle' \
  && bundle install

# bundle exec ruby app.rb を実行 
CMD ["bundle", "exec", "ruby", "app.rb"]
# シェルを起動
# CMD ["/bin/bash"]