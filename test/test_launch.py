from msedge.selenium_tools import Edge, EdgeOptions


if __name__ == '__main__':
    options = EdgeOptions()
    options.use_chromium = True
    options.add_argument('no-sandbox')
    caps = {'browserName': 'MicrosoftEdge', 'platform': 'LINUX'}
    driver = Edge(options=options)
