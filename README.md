# z80oolong/joplin -- ノートアプリケーション joplin を Linux に導入するための Tap リポジトリ

## 概要

[Joplin][JOPL] は、ノート及び Todo アプリケーションである [Evernote][EVER] の代替となるアプリケーションです。

[Joplin][JOPL] は、Markdown 形式でノート等を記述でき、 [Joplin][JOPL] のクライアントアプリがクロスプラットフォームで動作し、 Webdav サーバと [NextCloud サーバ][NCLD] 及び [Dropbox][DROP] 等を介してノート等の同期を行うことが出来るのが特徴です。

しかし、 [Joplin][JOPL] を [Homebrew][HBRW] を用いて導入する場合、 [Joplin][JOPL] を導入するための Formula が cask に移行されたため、現状では Linux への導入が出来ない状態となっております。

本リポジトリは、 Linux の各種ディストリビューション上に [Linuxbrew][BREW] を用いて、 [Joplin][JOPL] のデスクトップクライアントアプリケーション及び CLI クライアントアプリケーションを導入する為の Formula を含む [Linuxbrew][BREW] の Tap リポジトリです。

## 使用法

まず最初に、以下に示す Qiita の投稿及び Web ページの記述に基づいて、手元の端末に [Linuxbrew][BREW] を構築し、以下のように  ```brew tap``` コマンドを用いて本リポジトリを導入します。

- [thermes 氏][THER]による "[Linuxbrew のススメ][THBR]" の投稿
- [Linuxbrew の公式ページ][BREW]

そして、本リポジトリに含まれる Formula を以下のようにインストールします。

```
 $ brew tap z80oolong/joplin
 $ brew install <formula>
```

なお、一時的な手法ですが、以下のようにして URL を直接指定してインストールすることも出来ます。

```
 $ brew install https://raw.githubusercontent.com/z80oolong/homebrew-joplin/master/Formula/<formula>.rb
```

なお、本リポジトリに含まれる Formula の一覧及びその詳細については、本リポジトリに同梱する ```FormulaList.md``` を参照して下さい。

## その他詳細について

その他、本リポジトリ及び [Linuxbrew][BREW] の使用についての詳細は ```brew help``` コマンド及び  ```man brew``` コマンドの内容、若しくは [Linuxbrew の公式ページ][BREW]を御覧下さい。

## 謝辞

まず最初に、 [Laurent Cozic 氏][LAUR]を始めとした [Joplin][JOPL] の開発コミュニティ各位に心より感謝致します。

また、 [Joplin][JOPL] の CLI クライアントアプリケーションの導入にあたっては、 [Node.js][NODE] の仮想化環境作成ツールである [nodeenv][NENV] を参考にしました。 [Eugene Kalinin 氏][EUGE]を始めとする [nodeenv][NENV] の開発コミュニティ各位に心より感謝致します。

そして、[Linuxbrew][BREW] の導入に関しては、 [Linuxbrew の公式ページ][BREW] の他、 [thermes 氏][THER]による "[Linuxbrew のススメ][THBR]" 及び [Linuxbrew][BREW] 関連の各種資料を参考にしました。 [Linuxbrew の開発コミュニティ][BREW]及び[thermes 氏][THER]を始めとする各氏に心より感謝致します。

最後に、 [joplin][JOPL] に関わる全ての皆様及び、 [Linuxbrew][BREW] に関わる全ての皆様に心より感謝致します。

## 使用条件

本リポジトリは、 [Linuxbrew][BREW] の Tap リポジトリの一つとして、 [Linuxbrew の開発コミュニティ][BREW]及び [Z.OOL. (mailto:zool@zool.jpn.org)][ZOOL] が著作権を有し、[Linuxbrew][BREW] のライセンスと同様である [BSD 2-Clause License][BSD2] に基づいて配布されるものとします。詳細については、本リポジトリに同梱する ```LICENSE``` を参照して下さい。

<!-- 外部リンク一覧 -->

[JOPL]:https://joplinapp.org/
[EVER]:https://evernote.com/intl/jp
[NCLD]:https://nextcloud.com/
[DROP]:https://www.dropbox.com/ja/
[HBRW]:https://brew.sh/index_ja
[BREW]:https://linuxbrew.sh/
[LAUR]:https://github.com/laurent22
[NODE]:https://nodejs.org/ja/
[NENV]:https://github.com/ekalinin/nodeenv
[EUGE]:https://github.com/ekalinin
[THER]:https://qiita.com/thermes
[THBR]:https://qiita.com/thermes/items/926b478ff6e3758ecfea
[BSD2]:https://opensource.org/licenses/BSD-2-Clause
[ZOOL]:http://zool.jpn.org/
