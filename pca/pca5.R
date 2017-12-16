#pca5
#
#R in Action
library(psych)
fa.parallel(USJudgeRatings[,-1], fa='pc', n.iter=100,
            show.legend = F, main='Scree Plot with Parallel Analysis')
abline(h=1)
pc = principal(USJudgeRatings[,-1], nfactors = 1)
pc
pc = psych::principal(USJudgeRatings[,-1], nfactors = 1)
pc2 = principal(USJudgeRatings[,-1], nfactors = 2)
pc2

library(psych)
?Harman23.cor
str(Harman23.cor)
head(Harman23.cor)
Harman23.cor$cov
fa.parallel(Harman23.cor$cov, n.obs=302, fa='pc', n.iter=100,
      show.legend=FALSE, main='Scree plot with paralle analysis')

pc = principal(Harman23.cor$cov, nfactors=2, rotate='none')
pc

(rc = principal(Harman23.cor$cov, nfactors=2, rotate='varimax'))


pc = principal(USJudgeRatings[,-1], nfactors=1, score=T)
pc$scores
head(pc$scores)

cor(USJudgeRatings$CONT, pc$scores)

library(psych)
rc = principal(Harman23.cor$cov, nfactors=2, rotate='varimax')
round(unclass(rc$weights),2)


str(ability.cov)
options(digits=2)
(covariances = ability.cov$cov)
(correlations = cov2cor(covariances))

fa.parallel(correlations, n.obs=112, fa='both', 
            n.iter=100, main='Scree Plots with parallel analysis')


(fa <- fa(correlations, nfactors=2, rotate="none", fm="pa"))
(fa.varimax <- fa(correlations, nfactors=2, rotate="varimax", fm="pa"))

(fa.promax <- fa(correlations, nfactors=2, rotate="promax", fm="pa"))

fsm <- function(oblique) {
  if (class(oblique)[2]=="fa" & is.null(oblique$Phi)) {
    warning("Object doesn't look like oblique EFA")
  } else {
    P <- unclass(oblique$loading)
    F <- P %*% oblique$Phi
    colnames(F) <- c("PA1", "PA2")
    return(F)
  }
}
fsm(fa.promax)

factor.plot(fa.promax, labels = rownames(fa.promax$loadings))

fa.diagram(fa.promax, simple=FALSE)
fa.diagram(fa.promax, simple=TRUE)
fa.promax$weights

(fa.24tests = fa(Harman74.cor$cov,
                nfactors=4, rotate='promax'))
