#coding:utf-8

class HtmlOutputer(object):
    def __init__(self):
        self.datas = []
    
    def collect_data(self,data,count,basescore,basewordcount,basewordclick):
        if data is None:
            return
        score=data["score"]
        word_count=data["word_count"]
        word_click=data["word_click_num"]
        if float(score) > basescore and float(word_count) > basewordcount and float(word_click) > basewordclick:
                  self.datas.append(data)
                  count+=1
        return count
    
    def output_html(self):
        fout = open('output.html','w')
        fout.write("<html>")
        fout.write("<body>")
        fout.write("<table>")
        #ascii默认编码
        i=0
        for data in self.datas:
            if i==0:
                fout.write("<tr>")
                fout.write("<td>小说名<td>")
                fout.write("<td>地址<td>")
                fout.write("<td>类别<td>")
                fout.write("<td>评分<td>")
                fout.write("<td>字数(万)<td>")
                fout.write("<td>周点击(万)<td>")
                fout.write("<td>简介<td>")
                fout.write("<tr>")
                i+=1
            fout.write("<tr>")
            fout.write("<td>%s<td>"%data['title'].encode('utf8'))
            fout.write("<td>%s<td>"%data['url'])
            fout.write("<td>%s<td>"%data['book_category'].encode('utf8'))
            fout.write("<td>%s<td>"%data['score'])
            fout.write("<td>%s<td>"%data['word_count'])
            fout.write("<td>%s<td>"%data['word_click_num'])
            fout.write("<td>%s<td>"%data['summary'].encode('utf8'))
            fout.write("<tr>")
        fout.write("<table>")    
        fout.write("<body>")
        fout.write("<html>")
    



