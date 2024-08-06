    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s" style="background-image: url('<?= base_url('assets/files/header1.jpg') ?>');">
        <div class="container text-center py-5">
            <h1 class="display-2 text-dark mb-4 animated slideInDown">Pesanan</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Pages</a></li>
                    <li class="breadcrumb-item text-dark" aria-current="page">Order</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- Contact Start -->
    <div class="container-xxl contact py-5">
        <div class="container">
            <div class="section-title text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="fs-5 fw-medium fst-italic text-primary">Pesanan</p>
                <h1 class="display-6">Silakan cek status pesanan Anda secara berkala</h1>
            </div>
            <div class="row">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <h4 class="card-title">Data Pesanan Paket Pernikahan</h4>
                        </div>
                        <div class="col-lg-12">
                            <?= $this->session->flashdata('message'); ?>
                        </div>
                    </div>
                    <div class="table-responsive pt-3">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th class="text-center">No</th>
                                    <th class="text-center">Gambar</th>
                                    <th class="text-center">Nama Paket</th>
                                    <th class="text-center">Nama Pemesan</th>
                                    <th class="text-center">Email Pemesan</th>
                                    <th class="text-center">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $no = 1;
                                foreach ($getAllPesanan as $row): ?>
                                    <tr>
                                    <td><?= $no++; ?></td>
                                        <td class="text-center">
                                            <a href="<?= base_url('assets/files/katalog/').$row->image; ?>" target="_blank">
                                                <img src="<?= base_url('assets/files/katalog/').$row->image; ?>" class="img-fluid" style="border-radius:10%; width:60px; height:60px;" alt="">
                                            </a>
                                        </td>
                                        <td><?= $row->package_name; ?></td>
                                        <td class="text-center"><?= $row->name; ?></td>
                                        <td class="text-center"><?= $row->email; ?></td>
                                        <td class="text-center">
                                        <?php if($row->status == 'requested') { 
                                            echo 'Menunggu Konfirmasi';
                                        } else if ($row->status == 'rejected'){
                                            echo 'Pesanan Ditolak';
                                        } else if ($row->status == 'cancelled'){
                                            echo 'Pesanan Dibatalkan';
                                        } else {
                                            echo 'Pesanan Diterima';
                                        } ?>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
        </div>
    </div>
    <!-- Contact End -->
