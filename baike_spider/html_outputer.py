#coding:utf-8

class HtmlOutputer(object):
    def __init__(self):
        self.datas = []
    
    def collect_data(self,data,count,basescore):
        if data is None:
            return
        score=data["score"]
        if score > basescore:
          self.datas.append(data)
          count+=1
        return count
    
    def output_html(self):
        fout = open('output.html','w')
        fout.write("<html>")
        fout.write("<body>")
        fout.write("<table>")
        #ascii默认编码
        for data in self.datas:
            fout.write("<tr>")
            fout.write("<td>%s<td>"%data['url'])
            fout.write("<td>%s<td>"%data['title'].encode('utf8'))
            fout.write("<td>%s<td>"%data['score'])
            fout.write("<td>%s<td>"%data['summary'].encode('utf8'))
            fout.write("<tr>")
        fout.write("<table>")    
        fout.write("<body>")
        fout.write("<html>")
    



