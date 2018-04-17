<#include "macro-head.ftl">
<#include "macro-comments.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${article.articleTitle} - ${blogTitle}">
        <meta name="keywords" content="${article.articleTags}" />
        <meta name="description" content="${article.articleAbstract?html}" />
        </@head>
        <#if previousArticlePermalink??>
            <link rel="prev" title="${previousArticleTitle}" href="${servePath}${previousArticlePermalink}">
        </#if>
        <#if nextArticlePermalink??>
            <link rel="next" title="${nextArticleTitle}" href="${servePath}${nextArticlePermalink}">
        </#if>
            <!-- Open Graph -->
            <meta property="og:locale" content="zh_CN"/>
            <meta property="og:type" content="article"/>
            <meta property="og:title" content="${article.articleTitle}"/>
            <meta property="og:description" content="${article.articleAbstract?html}"/>
            <meta property="og:image" content="${article.authorThumbnailURL}"/>
            <meta property="og:url" content="${servePath}${article.articlePermalink}"/>
            <meta property="og:site_name" content="Solo"/>
            <!-- Twitter Card -->
            <meta name="twitter:card" content="summary"/>
            <meta name="twitter:description" content="${article.articleAbstract?html}"/>
            <meta name="twitter:title" content="${article.articleTitle}"/>
            <meta name="twitter:image" content="${article.authorThumbnailURL}"/>
            <meta name="twitter:url" content="${servePath}${article.articlePermalink}"/>
            <meta name="twitter:site" content="@DL88250"/>
            <meta name="twitter:creator" content="@DL88250"/>
    </head>
    <body>
        ${topBarReplacement}
        <#include "header.ftl">
        <div class="wrapper">
            <div class="container">
                <div class="module">
                    <article class="article">
                        <time class="article-time">
                            <span>
                                <#if article.hasUpdated>
                                ${article.articleUpdateDate?string("yy-MM-dd HH:mm")}
                                <#else>
                                ${article.articleCreateDate?string("yy-MM-dd HH:mm")}
                                </#if>
                            </span>
                        </time>
                        <h2 class="article-title">
                            <a href="${servePath}${article.articlePermalink}">
                                ${article.articleTitle}
                            </a>
                            <#if article.hasUpdated>
                            <sup>
                                ${updatedLabel}
                            </sup>
                            </#if>
                            <#if article.articlePutTop>
                            <sup>
                                ${topArticleLabel}
                            </sup>
                            </#if>
                        </h2>
                        <div class="article-body">
                            ${article.articleContent}
                        </div>
                        <#if "" != article.articleSign.signHTML?trim>
                        <p>
                            ${article.articleSign.signHTML}
                        </p>
                        </#if>
                        <span class="ico-tags ico" title="${tagLabel}">
                            <#list article.articleTags?split(",") as articleTag><a rel="tag" href="${servePath}/tags/${articleTag?url('UTF-8')}">${articleTag}</a><#if articleTag_has_next>,</#if></#list>
                        </span>
                        <span class="ico-author ico" title="${authorLabel}">
                            <a rel="author" href="${servePath}/authors/${article.authorId}">${article.authorName}</a>
                        </span>
                        <span class="ico-comment ico" title="${commentLabel}">

                            <a rel="nofollow" href="${servePath}${article.articlePermalink}#comments">
                                <#if article.articleCommentCount == 0>
                                ${noCommentLabel}
                                <#else>
                                ${article.articleCommentCount}
                                </#if>
                            </a>
                        </span>
                        <span class="ico-view ico" title="${viewLabel}">
                            <a rel="nofollow" href="${servePath}${article.articlePermalink}">
                                ${article.articleViewCount}
                            </a>
                        </span>
                    </article>
                    <div class="fn-clear" style="margin-top: 30px;">
                        <#if nextArticlePermalink??>
                        <div class="left">
                            <a href="${servePath}${nextArticlePermalink}">
                                <span class="ico-pre">«</span>
                                <span class="ft-pre">${nextArticleTitle}</span>
                            </a>
                        </div>
                        </#if>                            
                        <#if previousArticlePermalink??>
                        <div class="right">
                            <a href="${servePath}${previousArticlePermalink}">
                                <span class="left ft-next">${previousArticleTitle}</span>
                                <span class="ico-next">»</span>
                            </a> 
                        </div>
                        </#if>
                    </div>
                    <@comments commentList=articleComments article=article></@comments>
                </div>
            </div>
        </div>
        <#include "footer.ftl">
        <@comment_script oId=article.oId>
        </@comment_script>    
    </body>
</html>
