config.load_autoconfig(False)

c.content.proxy = 'http://localhost:7890'

c.downloads.location.directory = '/home/wkj/'

c.url.start_pages = 'https://search.brave.com'
c.url.searchengines['DEFAULT'] = 'https://search.brave.com/search?q={}'

