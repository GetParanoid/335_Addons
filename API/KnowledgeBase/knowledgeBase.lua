--==============================
-- Knowledge-base functions
--==============================

--- Requests a specific knowledge base article from the server
--- Flags: server
---@param articleId number The unique articleId to request
---@param searchType any The search type of the request ( number ) 1 - Default "top issues" search 2 - Search for specific text
function KBArticle_BeginLoading(articleId, searchType) end

--- Returns information about the last requested knowledge base article. Only available once the KNOWLEDGE_BASE_ARTICLE_LOAD_SUCCESS event has fired following an article request.
---@return number id A unique identifier for the article
---@return string subject The subject of the article
---@return string subjectAlt Alternate text for the article subject
---@return string text The body of the article
---@return string keywords A comma separated list of keywords for the article
---@return number languageId Identifier for the article's language (ee KBSetup_GetLanguageData )
---@return boolean isHot true if the article is a "Hot Item", otherwise false
function KBArticle_GetData() end

--- Returns whether the requested knowledge base article has been loaded. The KNOWLEDGE_BASE_ARTICLE_LOAD_SUCCESS also indicates that the requested article is available; this function presents an alternative that can be used across UI reloads or login/logout.
---@return boolean isLoaded True if data for the last requested article is available; otherwise false
function KBArticle_IsLoaded() end

--- Queries the knowledge base server for articles
--- Flags: server
---@param searchText string The search string to use.  The empty string will search for all articles in the given category
---@param categoryIndex number The category index
---@param subcategoryIndex number The subcategory index
---@param numArticles number The number of articles to be returned for each page
---@param page number The page of the total results that should be displayed.
function KBQuery_BeginLoading(searchText, categoryIndex, subcategoryIndex, numArticles, page) end

--- Returns the number of articles on the current knowledge base search result page
---@return number articleHeaderCount The number of articles on the current knowledge base search result base page
function KBQuery_GetArticleHeaderCount() end

--- Returns information about an article returned in a knowledge base query
---@param index number The index of the article to query
---@return number articleId A unique articleId for the article
---@return string title The title of the article
---@return boolean isHotIssue true if the article is a "Hot Issue", otherwise false
---@return boolean isRecentlyUpdated true if the article has been recently updated, otherwise false
function KBQuery_GetArticleHeaderData(index) end

--- Returns the total number of articles returned for the given query
---@return number totalArticleHeaderCount The total number of articles returned for the given query
function KBQuery_GetTotalArticleCount() end

--- Returns whether results of a knowledge base query have been loaded. The KNOWLEDGE_BASE_QUERY_LOAD_SUCCESS also indicates that the requested results are available; this function presents an alternative that can be used across UI reloads or login/logout.
---@return boolean isLoaded True if query results are available; otherwise false
function KBQuery_IsLoaded() end

--- Loads a maximum number of "Top Issues" from a given page
---@param numArticles number The number of articles displayed per page.  This is typically the constant KBASE_NUM_ARTICLES_PER_PAGE
---@param currentPage number The page to display
function KBSetup_BeginLoading(numArticles, currentPage) end

--- Returns the number of "Top Issues" articles on the current page
---@return number articleHeaderCount The number of "Top Issues" articles on the current page
function KBSetup_GetArticleHeaderCount() end

--- Returns header information about a "Top Issue" article
---@param index number The index of the article to query
---@return number articleId A unique articleId for the article
---@return string title The title of the article
---@return boolean isHotIssue true if the article is a "Hot Issue", otherwise false
---@return boolean isRecentlyUpdated true if the article has been recently updated, otherwise false
function KBSetup_GetArticleHeaderData(index) end

--- Returns the number of available knowledge base categories
---@return number numCategories The number of available knowledge base categories
function KBSetup_GetCategoryCount() end

--- Returns information about a knowledge base category
---@param index number The index of the category
---@return number categoryId The unique identifier for the given category
---@return string name The name of the category
function KBSetup_GetCategoryData(index) end

--- Returns the number of available knowledge base languages
---@return number numLanguages The number of available knowledge base languages
function KBSetup_GetLanguageCount() end

--- Returns information about a given knowledge base language
---@param index number Index of a language to query (between 1 and KBSetup_GetLanguageCount()
---@return number languageId A number identifying the language in article headers
---@return string name The name of the language
function KBSetup_GetLanguageData(index) end

--- Returns the number of available subcategories for a given category
---@param index number The index of the category
---@return number numSubCategories The number of available subcategories
function KBSetup_GetSubCategoryCount(index) end

--- Returns information a knowledge base subcategory
---@param index number The index of the category
---@param subindex number The index of the subcategory
---@return number categoryId The unique categoryId for the given subcategory
---@return string name The name of the subcategory
function KBSetup_GetSubCategoryData(index, subindex) end

--- Returns the number of "Top Issues" articles
---@return number numArticles The total number of "Top Issues" articles
function KBSetup_GetTotalArticleCount() end

--- Returns whether the knowledge base default query has completed successfully. The KNOWLEDGE_BASE_SETUP_LOAD_SUCCESS also indicates that the knowledge base setup is complete; this function presents an alternative that can be used across UI reloads or login/logout.
---@return boolean isLoaded True if results for the knowledge base's default "Top Issues" query are available; false if a query is in progress or has failed
function KBSetup_IsLoaded() end

--- Returns the currently knowledge base MOTD
---@return string text The message of the day for the knowledge base system
function KBSystem_GetMOTD() end

--- Returns the text of the knowledge base server system notice
---@return string text The text of the knowledgebase system server notice
function KBSystem_GetServerNotice() end

--- Returns the knowledge base server system status message
---@return string statusMessage The knowledge base server status message, or nil
function KBSystem_GetServerStatus() end
