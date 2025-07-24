#install.packages("quadprog")
library(quadprog)

w_mkt <- c(0.25, 0.10, 0.30, 0.15, 0.10, 0.10)
names(w_mkt) <- c("RF_D", "RF_E", "RV_D", "RV_E", "COM_E", "COM_M")

vol <- c(0.04, 0.06, 0.15, 0.20, 0.18, 0.22)  # desvío estándar
cor_mat <- matrix(c(
  1.00, 0.60, 0.20, 0.10, 0.05, 0.05,
  0.60, 1.00, 0.25, 0.15, 0.10, 0.10,
  0.20, 0.25, 1.00, 0.75, 0.30, 0.25,
  0.10, 0.15, 0.75, 1.00, 0.35, 0.30,
  0.05, 0.10, 0.30, 0.35, 1.00, 0.60,
  0.05, 0.10, 0.25, 0.30, 0.60, 1.00
), nrow = 6, byrow = TRUE)

Sigma <- diag(vol) %*% cor_mat %*% diag(vol)
colnames(Sigma) <- rownames(Sigma) <- names(w_mkt)

lambda <- 2.5
tau <- 0.025
pi <- lambda * Sigma %*% w_mkt

P <- matrix(c(
  0, 0, 0, 1, 0, 0,     # RV_E
  -1, 1, 0, 0, 0, 0,     # RF_E - RF_D
  0, 0, 0, 0, 1, -1     # COM_E - COM_M
), nrow = 3, byrow = TRUE)

Q <- matrix(c(0.12, 0.015, 0.01), ncol = 1)

Omega <- diag(c(0.0005, 0.0003, 0.0004))

inv_tauSigma <- solve(tau * Sigma)
middle <- solve(inv_tauSigma + t(P) %*% solve(Omega) %*% P)
mu_bl <- middle %*% (inv_tauSigma %*% pi + t(P) %*% solve(Omega) %*% Q)
rownames(mu_bl) <- names(w_mkt)
mu_bl

Dmat <- 2 * Sigma
dvec <- as.numeric(mu_bl) / lambda
Amat <- cbind(rep(1, 6), diag(6))
bvec <- c(1, rep(0, 6))

sol <- solve.QP(Dmat, dvec, Amat, bvec, meq = 1)
w_opt <- sol$solution
names(w_opt) <- names(w_mkt)
w_opt

View(w_opt)

View(w_mkt)

