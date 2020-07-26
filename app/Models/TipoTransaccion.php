<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class TipoTransaccion
 * 
 * @property int $idTipoTransaccion
 * @property string $descripcion
 * @property int $nivel
 * @property bool|null $esCompra
 * @property bool|null $esVenta
 * @property bool|null $esInventario
 * @property int|null $correlativo
 * @property bool|null $signo
 * @property string|null $prefijo
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Collection|Compra[] $compras
 * @property Collection|CuentasPorCobrar[] $cuentas_por_cobrars
 * @property Collection|CuentasPorPagar[] $cuentas_por_pagars
 * @property Collection|Inventario[] $inventarios
 * @property Collection|Venta[] $venta
 *
 * @package App\Models
 */
class TipoTransaccion extends Model
{
	protected $table = 'tipo_transaccion';
	protected $primaryKey = 'idTipoTransaccion';
	public $timestamps = false;

	protected $casts = [
		'nivel' => 'int',
		'esCompra' => 'bool',
		'esVenta' => 'bool',
		'esInventario' => 'bool',
		'correlativo' => 'int',
		'signo' => 'bool',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'descripcion',
		'nivel',
		'esCompra',
		'esVenta',
		'esInventario',
		'correlativo',
		'signo',
		'prefijo',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function compras()
	{
		return $this->hasMany(Compra::class, 'idTipoTransaccion');
	}

	public function cuentas_por_cobrars()
	{
		return $this->hasMany(CuentasPorCobrar::class, 'idTipoTransaccion');
	}

	public function cuentas_por_pagars()
	{
		return $this->hasMany(CuentasPorPagar::class, 'idTipoTransaccion');
	}

	public function inventarios()
	{
		return $this->hasMany(Inventario::class, 'idTipoTransaccion');
	}

	public function venta()
	{
		return $this->hasMany(Venta::class, 'idTipoTransaccion');
	}
}
