sitetovim() {
	w3m $(duckduckgo "$(w3m $1 | grep -E "$2" | dmenu -l 30)" | grep "www." | echo $(dmenu -l 30) | tr -d ' ') | vim
}
yleuutiset() {
	sitetovim yle.fi/uutiset/tuoreimmat "^[A-Ö]"
}
hackernews() {
	sitetovim news.ycombinator.com/front "[(]"
}
aljazeera() {
	sitetovim aljazeera.com "• [A-Z]"
}
readallthenews() {
	yleuutiset
	aljazeera
	hackernews
}
thinkaboutallthenews() {
	mkdir ~/topicstobrowse
	cd ~/topicstobrowse
	mkdir $(date -I)
	cd $(date -I)
	readallthenews
}
combinethethonks() {
	cd ~/topicstobrowse/
	find ~/topicstobrowse/ | grep -E ".md$" > comb.md
	less $(cat comb.md)
}
thinkandcombineaboutnews() {
	thinkaboutallthenews
	combinethethonks
	cat $(comb.md) | vim
}

